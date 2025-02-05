//
//  InEventViewController.swift
//  Eventa
//
//  Created by Jai Khurana on 05/02/25.
//

import UIKit

class InEventViewController: UIViewController {

    @IBOutlet var titleEventName: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        titleEventName.title = "Event Name"
        // Do any additional setup after loading the view.
    }
    @IBAction func exitTabBarButton(_ sender: Any) {
        if let tabBarController = tabBarController as? MainTabBarViewController {
            tabBarController.selectedIndex = 0
            tabBarController.hideTab(at: 2)
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
