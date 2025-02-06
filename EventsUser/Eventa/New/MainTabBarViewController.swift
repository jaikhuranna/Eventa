//
//  MainTabBarViewController.swift
//  Eventa
//
//  Created by Jai Khurana on 01/02/25.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    var onbarded = false;
    var inEvent = false;
    
    private var initialViewControllers: [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        initialViewControllers = self.viewControllers ?? []
        if !inEvent
        {
            hideTab(at: 2)
        }
    }
    
    
    func hideTab(at index: Int) {
           guard var vcs = self.viewControllers, vcs.count > index else { return }
           vcs.remove(at: index)
        self.setViewControllers(vcs, animated: true)
       }
       
       func restoreTabs() {
           self.setViewControllers(initialViewControllers, animated: true)
       }
    
    override func viewDidAppear(_ animated: Bool) {
        if !onbarded {
            performSegue(withIdentifier: "onboarding", sender: self)
            onbarded = true;
        }
    }

}
