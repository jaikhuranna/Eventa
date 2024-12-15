//
//  AddImageViewController.swift
//  Eventa Organiser
//
//  Created by Jai Khurana on 15/12/24.
//

import UIKit

class AddImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var addImageButton: UIButton!
    
    static var imageToSend : UIImage? = nil
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.layer.cornerRadius = 16
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressAddImageButton(_ sender: Any) {
        if imageView.image == nil {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            present(imagePicker, animated: true, completion: nil)
        }
        else {
            performSegue(withIdentifier: "tofinalEventDataCheck", sender: self )
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           if let selectedImage = info[.originalImage] as? UIImage {
               // Do something with the image
               imageView.image = selectedImage
               addImageButton.setTitle("Next", for: .normal)
               print("Image selected!")
               AddImageViewController.imageToSend = selectedImage
               
           }
           picker.dismiss(animated: true, completion: nil)
       }

       func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
           picker.dismiss(animated: true, completion: nil)
       }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
