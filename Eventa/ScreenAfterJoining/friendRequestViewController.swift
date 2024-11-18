//
//  friendRequestViewController.swift
//  Eventa
//
//  Created by Aryan on 19/11/24.
//

import UIKit

class friendRequestViewController: UIViewController {

    @IBOutlet weak var profilePicture: UIImageView!
    
    @IBOutlet weak var NameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profilePicture.image = users[1].profilePhoto
        
        NameLabel.text = users[1].name
        
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
