//
//  EventDetailsViewController.swift
//  Eventa
//
//  Created by Jai Khurana on 03/02/25.
//

import CallKit
import UIKit
import MapKit


class EventDetailsViewController: UIViewController {

    static var eventToShow : Event?
    
    static var rowindex:Int?
    static var sectionindex:Int?

    @IBOutlet var eventLabel: UILabel!
    
    @IBOutlet var titleHolderView: UIView!
    @IBOutlet var Image: UIImageView!
    @IBOutlet var Dateandtimecenter: UILabel!
    @IBOutlet var mapview: MKMapView!
    @IBOutlet var costLabel: UILabel!
    
    @IBOutlet var OrganiserName: UILabel!
    
    @IBOutlet var OrganiserLocationLabel: UILabel!
    
    @IBOutlet var OrganiserProfleImage: UIImageView!
    @IBOutlet var EventDescription: UILabel!
    
    @IBOutlet var userAttendingcount: UILabel!
    @IBOutlet var userAttendingNumberView: UIView!
    @IBOutlet var userAttendingImage3: UIImageView!
    @IBOutlet var userAttendingImage2: UIImageView!
    @IBOutlet var userAttendingImage1: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let EventToShow = EventDetailsViewController.eventToShow!;
        
        Image.image = UIImage(named: EventToShow.imageURL)
        Image.layer.cornerRadius = 15;
        titleHolderView.layer.cornerRadius = 16;
        eventLabel.text = EventToShow.title
        Dateandtimecenter.text = EventToShow.date.formatted()
        mapview.showsLargeContentViewer = true
        mapview.layer.cornerRadius = 5
        costLabel.text = String(EventToShow.cost)
        
        userAttendingImage1.layer.cornerRadius = 18
        userAttendingImage2.layer.cornerRadius = 18
        userAttendingImage3.layer.cornerRadius = 18
         
        userAttendingcount.text = String(12)+"+";
        userAttendingNumberView.layer.cornerRadius = 18
    }
    @IBAction func joinEventButton(_ sender: Any) {
        if let tabBarController = self.tabBarController as? MainTabBarViewController {
            InEventViewController.eventToShow = EventDetailsViewController.eventToShow!
//            tabBarController.hideTab(at: 1) // Hides second tab
            tabBarController.restoreTabs()  // Restores original setup
            tabBarController.selectedIndex = 2
            tabBarController.inEvent = true;
        }
    }
    
    
    @IBAction func phoneCallOrganiser(_ sender: Any) {
        if let phoneURL = URL(string: "tel://9354883188") {
            if UIApplication.shared.canOpenURL(phoneURL) {
                UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
            } else {
                // Handle the error, maybe show an alert that calling is not supported
                print("Cannot open the phone app")
            }
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
