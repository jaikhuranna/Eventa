//
//  HomeViewController.swift
//  Eventa
//
//  Created by Jai Khurana on 06/11/24.
//

import UIKit
import CoreLocation

class ExploreViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationLabel.text = "Chennai, Tamil Nadu"
    }
    

}
