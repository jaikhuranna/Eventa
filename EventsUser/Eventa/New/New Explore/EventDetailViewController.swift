//
//  EventDetailsViewController.swift
//  Eventa
//
//  Created by Jai Khurana on 03/02/25.
//

import UIKit
import MapKit

class EventDetailsViewController: UIViewController {

    static var rowindex:Int?
    static var sectionindex:Int?

    @IBOutlet var eventLabel: UILabel!
    
    @IBOutlet var titleHolderView: UIView!
    @IBOutlet var Image: UIImageView!
    @IBOutlet var Dateandtimecenter: UILabel!
    @IBOutlet var mapview: MKMapView!
    @IBOutlet var costLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let EventToShow = DataModel.allEvents[EventDetailsViewController.sectionindex!][EventDetailsViewController.rowindex!]
        Image.image = UIImage(named: EventToShow.imageURL)
        Image.layer.cornerRadius = 15;
        titleHolderView.layer.cornerRadius = 16;
        eventLabel.text = EventToShow.title
        Dateandtimecenter.text = EventToShow.date.formatted()
        mapview.showsLargeContentViewer = true
        mapview.layer.cornerRadius = 5
        costLabel.text = String(EventToShow.cost)
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
