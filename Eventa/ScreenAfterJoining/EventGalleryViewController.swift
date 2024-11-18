//
//  EventGalleryViewController.swift
//  screenAfterJoining
//
//  Created by Vinod P on 17/11/24.
//
import UIKit

class EventGalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    // Data source for the collection view (2 sections)
    var imageData: [[UIImage]] = [[], []] // Section 0: Initial images, Section 1: Added images

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load initial images from assets into Section 0
        loadInitialImages()
        
        // Set up collection view
        setupCollectionView()
        
        // Add button action
        addButton.addTarget(self, action: #selector(addImage), for: .touchUpInside)
        
        // Save button action
        saveButton.target = self
        saveButton.action = #selector(saveImages)
    }
    
    private func loadInitialImages() {
        // Load images from assets named "gallery1", "gallery2", "gallery3", etc.
        for i in 1...10 { // Adjust the range as per the number of images in assets
            if let image = UIImage(named: "gallery\(i)") {
                imageData[0].append(image) // Add to Section 0
            }
        }
    }
    
    private func setupCollectionView() {
        // Set up collection view layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: collectionView.frame.width * 0.8, height: collectionView.frame.height * 0.8)
        layout.minimumLineSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        
        collectionView.collectionViewLayout = layout
        
        // Set delegates
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Register cell
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "ImageCell")
    }

    // MARK: - Button Actions
    @objc private func addImage() {
        // Open photo library to select an image
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc private func saveImages() {
        // Save images from both sections to the app's document directory
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        for (sectionIndex, sectionImages) in imageData.enumerated() {
            for (imageIndex, image) in sectionImages.enumerated() {
                let fileName = "savedImage_\(sectionIndex)_\(imageIndex).jpg"
                let filePath = documentsDirectory.appendingPathComponent(fileName)
                
                if let imageData = image.jpegData(compressionQuality: 1.0) {
                    do {
                        try imageData.write(to: filePath)
                        print("Image saved at \(filePath)")
                    } catch {
                        print("Error saving image: \(error)")
                    }
                }
            }
        }
    }

    // MARK: - UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            imageData[1].append(selectedImage) // Add to Section 1
            collectionView.reloadData() // Reload collection view
        }
        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return imageData.count // Two sections: 0 for initial images, 1 for added images
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageData[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCollectionViewCell
        cell.configure(with: imageData[indexPath.section][indexPath.row]) // Pass image to the cell
        return cell
    }

    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

// MARK: - Custom Collection View Cell
class ImageCollectionViewCell: UICollectionViewCell {
    
    // ImageView to display the image
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Add imageView to contentView
        contentView.addSubview(imageView)
        
        // Set constraints for imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(with image: UIImage) {
        imageView.image = image
    }
}

/*
 import UIKit
 
 class EventGalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
 
 // Outlets
 @IBOutlet weak var collectionView: UICollectionView!
 @IBOutlet weak var addButton: UIButton!
 @IBOutlet weak var saveButton: UIBarButtonItem!
 
 // Data source for the collection view
 var imageData: [UIImage] = []
 
 override func viewDidLoad() {
 super.viewDidLoad()
 
 // Set up collection view
 setupCollectionView()
 
 // Add button action
 addButton.addTarget(self, action: #selector(addImage), for: .touchUpInside)
 
 // Save button action
 saveButton.target = self
 saveButton.action = #selector(saveImages)
 }
 
 private func setupCollectionView() {
 // Set up collection view layout
 let layout = UICollectionViewFlowLayout()
 layout.scrollDirection = .horizontal
 layout.itemSize = CGSize(width: collectionView.frame.width * 0.8, height: collectionView.frame.height * 0.8)
 layout.minimumLineSpacing = 20
 layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
 
 collectionView.collectionViewLayout = layout
 
 // Set delegates
 collectionView.delegate = self
 collectionView.dataSource = self
 
 // Register cell
 collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "ImageCell")
 }
 
 // MARK: - Button Actions
 @objc private func addImage() {
 // Open photo library to select an image
 let imagePicker = UIImagePickerController()
 imagePicker.delegate = self
 imagePicker.sourceType = .photoLibrary
 present(imagePicker, animated: true, completion: nil)
 }
 
 @objc private func saveImages() {
 // Save images to the app's document directory
 let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
 
 for (index, image) in imageData.enumerated() {
 let fileName = "savedImage_\(index).jpg"
 let filePath = documentsDirectory.appendingPathComponent(fileName)
 
 if let imageData = image.jpegData(compressionQuality: 1.0) {
 do {
 try imageData.write(to: filePath)
 print("Image saved at \(filePath)")
 } catch {
 print("Error saving image: \(error)")
 }
 }
 }
 }
 
 // MARK: - UIImagePickerControllerDelegate
 func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
 if let selectedImage = info[.originalImage] as? UIImage {
 imageData.append(selectedImage) // Add image to the data source
 collectionView.reloadData() // Reload collection view
 }
 dismiss(animated: true, completion: nil)
 }
 
 func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
 dismiss(animated: true, completion: nil)
 }
 
 // MARK: - UICollectionViewDataSource
 func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
 return imageData.count
 }
 
 func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
 let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCollectionViewCell
 cell.configure(with: imageData[indexPath.row]) // Pass image to the cell
 return cell
 }
 
 // MARK: - UICollectionViewDelegateFlowLayout
 func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
 return 20
 }
 }
 
 // MARK: - Custom Collection View Cell
 class ImageCollectionViewCell: UICollectionViewCell {
 
 // ImageView to display the image
 private let imageView: UIImageView = {
 let imageView = UIImageView()
 imageView.contentMode = .scaleAspectFill
 imageView.clipsToBounds = true
 imageView.layer.cornerRadius = 10
 return imageView
 }()
 
 override init(frame: CGRect) {
 super.init(frame: frame)
 
 // Add imageView to contentView
 contentView.addSubview(imageView)
 
 // Set constraints for imageView
 imageView.translatesAutoresizingMaskIntoConstraints = false
 NSLayoutConstraint.activate([
 imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
 imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
 imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
 imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
 ])
 }
 
 required init?(coder: NSCoder) {
 super.init(coder: coder)
 }
 
 func configure(with image: UIImage) {
 imageView.image = image
 }
 }
 
 /*
  import UIKit
  
  class EventGalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  @IBOutlet weak var saveButton: UIBarButtonItem!
  
  @IBOutlet weak var addButton: UIButton!
  
  var imageData: [[UIImage]] = []
  
  override func viewDidLoad() {
  super.viewDidLoad()
  
  // Load initial images from assets
  loadInitialImages()
  
  collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "ImageCell")
  
  let layout = UICollectionViewFlowLayout()
  layout.scrollDirection
  = .horizontal
  layout.itemSize = CGSize(width: collectionView.frame.width
  * 0.8, height: collectionView.frame.height * 0.8)
  layout.minimumLineSpacing = 20
  layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
  collectionView.collectionViewLayout = layout
  
  addButton.addTarget(self, action: #selector(addImageButtonTapped), for: .touchUpInside)
  saveButton.target = self
  saveButton.action = #selector(saveButtonTapped)
  }
  
  func loadInitialImages() {
  imageData = [
  [UIImage(named: "gallery1")!, UIImage(named: "gallery2")!, UIImage(named: "gallery3")!],
  [UIImage(named: "gallery4")!, UIImage(named: "gallery5")!, UIImage(named: "gallery6")!],
  [UIImage(named: "gallery7")!, UIImage(named: "gallery8")!]
  
  ]
  }
  
  @objc func addImageButtonTapped() {
  let imagePickerController = UIImagePickerController()
  imagePickerController.delegate = self
  imagePickerController.sourceType = .photoLibrary
  present(imagePickerController, animated: true, completion: nil)
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
  if let image = info[.originalImage] as? UIImage {
  imageData.append([image])
  collectionView.reloadData()
  }
  dismiss(animated: true, completion: nil)
  }
  
  @objc func saveButtonTapped() {
  // Implement your save functionality here.
  // For example, you can save the images to the app's Documents directory:
  let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
  for section in 0..<imageData.count {
  for image in imageData[section] {
  let fileName = "savedImage_\(section)_\(image).jpg"
  let filePath = documentsDirectory.appendingPathComponent(fileName)
  if let data = image.jpegData(compressionQuality: 1.0) {
  do {
  try data.write(to: filePath)
  print("Image saved successfully: \(filePath)")
  } catch {
  print("Error saving image: \(error)")
  }
  }
  }
  }
  }
  
  // MARK: - UICollectionViewDataSource
  func numberOfSections(in collectionView: UICollectionView) -> Int {
  return imageData.count
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
  return imageData[section].count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCollectionViewCell
  cell.imageView.image = imageData[indexPath.section][indexPath.row]
  cell.imageView.layer.cornerRadius = 10 // Adjust corner radius as needed
  cell.imageView.clipsToBounds = true
  return cell
  }
  
  // MARK: - UICollectionViewDelegateFlowLayout
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
  return 20
  }
  }
  
  class ImageCollectionViewCell: UICollectionViewCell {
  let imageView = UIImageView()
  
  override init(frame: CGRect) {
  super.init(frame: frame)
  
  imageView.contentMode = .scaleAspectFill
  contentView.addSubview(imageView)
  imageView.frame = contentView.bounds
  }
  
  required init?(coder aDecoder: NSCoder) {
  fatalError("init(coder:) has error")}
  }
  */
 /*
  import UIKit
  
  class EventGalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var saveButton: UIBarButtonItem!
  @IBOutlet weak var addButton: UIButton!
  
  var imageData: [[UIImage]] = []
  
  override func viewDidLoad() {
  super.viewDidLoad()
  
  // Load initial images
  loadInitialImages()
  
  // No need to register cell if using storyboard
  // Ensure the correct reuseIdentifier is set in storyboard
  
  // Configure collection view layout
  let layout = UICollectionViewFlowLayout()
  layout.scrollDirection = .horizontal
  layout.itemSize = CGSize(width: collectionView.frame.width * 0.8, height: collectionView.frame.height * 0.8)
  layout.minimumLineSpacing = 20
  layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
  collectionView.collectionViewLayout = layout
  
  // Button actions
  addButton.addTarget(self, action: #selector(addImageButtonTapped), for: .touchUpInside)
  saveButton.target = self
  saveButton.action = #selector(saveButtonTapped)
  
  collectionView.delegate = self
  collectionView.dataSource = self
  }
  
  func loadInitialImages() {
  // Ensure image names match assets
  imageData = [
  [UIImage(named: "gallery1")!, UIImage(named: "gallery2")!, UIImage(named: "gallery3")!],
  [UIImage(named: "gallery4")!, UIImage(named: "gallery5")!, UIImage(named: "gallery6")!],
  [UIImage(named: "gallery7")!, UIImage(named: "gallery8")!]
  ]
  }
  
  @objc func addImageButtonTapped() {
  let imagePickerController = UIImagePickerController()
  imagePickerController.delegate = self
  imagePickerController.sourceType = .photoLibrary
  present(imagePickerController, animated: true, completion: nil)
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
  if let image = info[.originalImage] as? UIImage {
  if imageData.isEmpty {
  imageData.append([image]) // Create new section if empty
  } else {
  imageData[0].append(image) // Append to the first section
  }
  collectionView.reloadData()
  }
  dismiss(animated: true, completion: nil)
  }
  
  @objc func saveButtonTapped() {
  let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
  for section in 0..<imageData.count {
  for row in 0..<imageData[section].count {
  let fileName = "savedImage_\(section)_\(row).jpg"
  let filePath = documentsDirectory.appendingPathComponent(fileName)
  if let data = imageData[section][row].jpegData(compressionQuality: 1.0) {
  do {
  try data.write(to: filePath)
  print("Image saved successfully: \(filePath)")
  } catch {
  print("Error saving image: \(error)")
  }
  }
  }
  }
  }
  
  // MARK: - UICollectionViewDataSource
  func numberOfSections(in collectionView: UICollectionView) -> Int {
  return imageData.count
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
  return imageData[section].count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryImageCell", for: indexPath) as! ImageCollectionViewCell
  cell.configure(image: imageData[indexPath.section][indexPath.row])
  return cell
  }
  
  // MARK: - UICollectionViewDelegateFlowLayout
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
  return 20
  }
  }
  
  class ImageCollectionViewCell: UICollectionViewCell {
  let imageView = UIImageView()
  
  override init(frame: CGRect) {
  super.init(frame: frame)
  
  // Configure imageView
  imageView.contentMode = .scaleAspectFill
  imageView.clipsToBounds = true
  imageView.layer.cornerRadius = 10
  contentView.addSubview(imageView)
  
  // Constrain imageView to fill the cell
  imageView.translatesAutoresizingMaskIntoConstraints = false
  NSLayoutConstraint.activate([
  imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
  imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
  imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
  imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
  ])
  }
  
  required init?(coder aDecoder: NSCoder) {
  super.init(coder: aDecoder)
  }
  
  func configure(image: UIImage) {
  imageView.image = image
  }
  }
  */
 
 */
