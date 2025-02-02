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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if !onbarded {
            performSegue(withIdentifier: "onboarding", sender: self)
            onbarded = true;
        }
    }

}
