//
//  ProfilePictureDisplayViewController.swift
//  Eventa
//
//  Created by Aryan on 18/11/24.
//

import UIKit

class ProfilePictureDisplayViewController: UIViewController {

    @IBOutlet weak var userGreeting: UILabel!
    
    var userName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let name = userName {
            userGreeting.text = "Hello, \(name)"
        }
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
