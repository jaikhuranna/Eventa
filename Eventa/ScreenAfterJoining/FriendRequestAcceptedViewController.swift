//
//  FriendRequestAcceptedViewController.swift
//  Eventa
//
//  Created by Aryan on 19/11/24.
//

import UIKit

class FriendRequestAcceptedViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var profilePicture: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        profilePicture.image = users[1].profilePhoto
        
        nameLabel.text = users[1].name
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
