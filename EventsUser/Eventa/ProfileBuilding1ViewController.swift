//
//  ProfileBuilding1ViewController.swift
//  Eventa
//
//  Created by Vinod P on 29/10/24.
//

import UIKit

class ProfileBuilding1ViewController: UIViewController {

    @IBOutlet weak var nameOutlet: UITextField!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var genderLabel: UILabel!
    
    var data = ["Male", "Female"]
    
    @IBOutlet weak var profilePicture: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        tapGesture()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "profileInfo " {
            let vc = segue.destination as! ProfilePictureDisplayViewController
            vc.userName = nameOutlet.text
        }
    }
    
    func tapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        profilePicture.isUserInteractionEnabled = true
        profilePicture.addGestureRecognizer(tap)
    }
    
    @objc func imageTapped() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        self.present(imagePickerController, animated: true, completion: nil)
    }

}

extension ProfileBuilding1ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genderLabel.text = data[row]
    }
}
