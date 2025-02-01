//
//  MainTabBarViewController.swift
//  Eventa
//
//  Created by Jai Khurana on 01/02/25.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    var onbarded = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if !onbarded {
            performSegue(withIdentifier: "onboarding", sender: self)
        }
    }
    

}
