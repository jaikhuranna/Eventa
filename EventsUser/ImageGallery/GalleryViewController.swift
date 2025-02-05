//
//  GalleryViewController.swift
//  Eventa
//
//  Created by Vinod P on 05/02/25.
//
import UIKit
import Firebase
import FirebaseStorage

private let reuseIdentifier = "GalleryCell"

class GalleryViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var images: [ImageModel] = [] // Array to store image data
    var eventID: String = "23156AAB-DB89-478C-804B-22DF94A0B4AF" // Pass this dynamically

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Explicitly setting flow layout
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        collectionView.collectionViewLayout = layout
        
        fetchImages()
        
        //long-press to save (trying to implement)
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        collectionView.addGestureRecognizer(longPressGesture)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleDownloadImage(_:)), name: Notification.Name("DownloadImage"), object: nil)
        
    }
    
    @objc func handleDownloadImage(_ notification: Notification) {
        if let imageUrl = notification.object as? String {
            downloadAndSaveImage(imageUrl)
        }
    }
    
    func downloadAndSaveImage(_ imageUrl: String) {
        guard let url = URL(string: imageUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data, let image = UIImage(data: data) {
                UIImageWriteToSavedPhotosAlbum(image, self, #selector(self.imageSaved(_:didFinishSavingWithError:contextInfo:)), nil)
            } else {
                print("Error downloading image: \(error?.localizedDescription ?? "Unknown error")")
            }
        }.resume()
    }
    
    @objc func imageSaved(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: error == nil ? "Saved!" : "Error",
                                          message: error == nil ? "Image has been saved to Photos." : error?.localizedDescription,
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
    }
        
    @objc func handleLongPress(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            let point = gesture.location(in: collectionView)
            if let indexPath = collectionView.indexPathForItem(at: point) {
                let imageModel = images[indexPath.item]
                showSaveImageActionSheet(imageModel.imageUrl)
            }
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.collectionViewLayout.invalidateLayout() // Force reloading layout
    }
    
    // to save an image function (working 
    func showSaveImageActionSheet(_ imageUrl: String) {
        let alert = UIAlertController(title: "Save Image", message: "Do you want to save this image to Photos?", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { _ in
            self.downloadAndSaveImage(imageUrl)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true)
    }
    
    func fetchImages() {
        let db = Firestore.firestore()
        db.collection("events").document(eventID).collection("images")
            .order(by: "timestamp", descending: true)
            .addSnapshotListener { snapshot, error in
                if let error = error {
                    print("Error fetching images: \(error.localizedDescription)")
                    return
                }
                
                self.images = snapshot?.documents.compactMap { doc in
                    let data = doc.data()
                    guard let imageUrl = data["imageUrl"] as? String,
                          let uploaderName = data["uploaderName"] as? String else { return nil }
                    return ImageModel(imageUrl: imageUrl, uploaderName: uploaderName)
                } ?? []
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
    }

    // MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCell", for: indexPath) as! GalleryCell
        cell.configure(with: images[indexPath.item])
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedImage = images[indexPath.item]
        performSegue(withIdentifier: "toPhotoDetails", sender: selectedImage)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPhotoDetails",
           let destinationVC = segue.destination as? PhotoDetailsViewController,
           let image = sender as? ImageModel {
            destinationVC.image = image
        }
    }
}

//chat gpt to implement imagePicker

extension GalleryViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBAction func addImageTapped(_ sender: UIBarButtonItem) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        picker.dismiss(animated: true)
        
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        uploadImage(selectedImage)
    }

    func uploadImage(_ image: UIImage) {
        let storageRef = Storage.storage().reference().child("event_images/\(UUID().uuidString).jpg")
        guard let imageData = image.jpegData(compressionQuality: 0.8) else { return }

        storageRef.putData(imageData, metadata: nil) { metadata, error in
            if let error = error {
                print("Upload error: \(error.localizedDescription)")
                return
            }
            
            storageRef.downloadURL { url, error in
                guard let downloadURL = url else { return }
                
                let db = Firestore.firestore()
                let imageRef = db.collection("events").document(self.eventID).collection("images").document()
                
                let imageData: [String: Any] = [
                    "imageUrl": downloadURL.absoluteString,
                    "uploaderName": "Vinod",
                    "timestamp": Timestamp()
                ]
                
                imageRef.setData(imageData) { error in
                    if let error = error {
                        print("Error saving image: \(error.localizedDescription)")
                    } else {
                        print("Image uploaded successfully!")
                    }
                }
            }
        }
    }
}

// sizeForItemAt adjustment


extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 3 // Adjust for desired grid size
        let padding: CGFloat = 8
        let totalPadding = (itemsPerRow - 1) * padding
        let itemWidth = (collectionView.bounds.width - totalPadding) / itemsPerRow
        return CGSize(width: itemWidth, height: itemWidth) // Make it a square
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8 // Adjust spacing between columns
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8 // Adjust spacing between rows
    }
}


// extension to load image properly, (has sm to do with saving image)
extension UIImageView {
    func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
    }
}
//import UIKit
//
//private let reuseIdentifier = "Cell"
//
//class GalleryViewController: UICollectionViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Uncomment the following line to preserve selection between presentations
//        // self.clearsSelectionOnViewWillAppear = false
//
//        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
//
//        // Do any additional setup after loading the view.
//    }
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using [segue destinationViewController].
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//    // MARK: UICollectionViewDataSource
//
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of items
//        return 0
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
//    
//        // Configure the cell
//    
//        return cell
//    }
//
//    // MARK: UICollectionViewDelegate
//
//    /*
//    // Uncomment this method to specify if the specified item should be highlighted during tracking
//    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//    */
//
//    /*
//    // Uncomment this method to specify if the specified item should be selected
//    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//    */
//
//    /*
//    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
//    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
//        return false
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
//        return false
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
//    
//    }
//    */
//
//}
