//
//  OnboardingNavigationViewController.swift
//  Eventa
//  Created by Aryan on 18/11/24.
//

import UIKit

class OnboardingNavigationViewController: UINavigationController {

    static var OnboardingNavCon : UINavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        OnboardingNavigationViewController.OnboardingNavCon = navigationController
//        navigationController.set
        // Do any additional setup after loading the view.
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
