//
//  ChatDetailScreenViewController.swift
//  Eventa
//
//  Created by Aryan on 18/11/24.
//

import UIKit

class ChatDetailScreenViewController: UIViewController {
    
    var name: String?

    @IBOutlet weak var nameOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameOutlet.text = name
        
    }

}
