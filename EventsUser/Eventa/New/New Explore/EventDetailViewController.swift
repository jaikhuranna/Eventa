//
//  EventDetailsViewController.swift
//  Eventa
//
//  Created by Jai Khurana on 03/02/25.
//

import UIKit
import MapKit

class EventDetailsViewController: UIViewController {

    static var indexvar:Int?
    
    @IBOutlet var eventLabel: UILabel!
    
    @IBOutlet var Image: UIImageView!
    @IBOutlet var Dateandtimecenter: UILabel!
    
    @IBOutlet var mapview: MKMapView!
    @IBOutlet var costLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
