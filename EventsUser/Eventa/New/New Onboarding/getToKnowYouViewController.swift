//
//  getToKnowYouViewController.swift
//  Eventa
//
//  Created by Jai Khurana on 03/02/25.
//

import UIKit

class getToKnowYouViewController: UIViewController {
    
    @IBOutlet var NameFeild: UITextField!
    
    @IBOutlet var getShortTagLine: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func toIntrestViewController(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let On4 = storyboard.instantiateViewController(withIdentifier: "On4")

        if let pageController = self.parent as? OnboardingPageViewController
        {
            pageController.pageControl.removeFromSuperview()
            pageController.setViewControllers( [On4], direction: .forward, animated: true)
        }
        OnboardIntrestsViewController.name = NameFeild.text!
        OnboardIntrestsViewController.tagline = getShortTagLine.text!
        
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
