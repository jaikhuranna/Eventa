//
//  ViewController.swift
//  Eventa
//
//  Created by Jai Khurana on 10/10/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func TESTgoToHome(){
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        if let homeviewController = storyboard.instantiateViewController(withIdentifier: "Home") as? HomeViewController {
            self.present(homeviewController, animated: true, completion: nil)
            }
    }
    
    @IBAction func hi(_ sender: Any) {
        TESTgoToHome()
    }
    
}

