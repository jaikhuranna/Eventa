//
//  ProfileBuilding1ViewController.swift
//  Eventa
//
//  Created by Vinod P on 29/10/24.
//

import UIKit

let pickerData = ["Male", "Female"]

class ProfileBuilding1ViewController: UIViewController {
    
    
    @IBOutlet weak var genderPicker: UIPickerView
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return pickerData.count
        }
    }
    
    
func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        genderPicker.delegate = self
        genderPicker.dataSource = self
        
    }

}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
}
