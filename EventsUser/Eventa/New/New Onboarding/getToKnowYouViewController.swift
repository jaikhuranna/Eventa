//
//  getToKnowYouViewController.swift
//  Eventa
//
//  Created by Jai Khurana on 03/02/25.
//

import UIKit

class getToKnowYouViewController: UIViewController {
    
    @IBOutlet var NameFeild: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func editedFeild(_ sender: Any) {
        getTaglineViewController.NameforLabel = NameFeild.text ?? "fd";
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
