//
//  SignUpSignInSelectViewController.swift
//  Eventa
//
//  Created by Jai Khurana on 07/02/25.
//

import UIKit
import FirebaseAuth

class SignUpSignInSelectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInButton(_ sender: Any) {
        
        //Check if in datafuckingbase
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let On5 = storyboard.instantiateViewController(withIdentifier: "On5")

        if let pageController = self.parent as? OnboardingPageViewController
        {
            pageController.pageControl.removeFromSuperview()
            pageController.setViewControllers( [On5], direction: .forward, animated: true)
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
