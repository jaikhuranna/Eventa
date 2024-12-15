//
//  EventDetailViewController.swift
//  Eventa
//
//  Created by Jai Khurana on 18/11/24.
//

import UIKit

class EventDetailViewController: UIViewController {
    
    @IBOutlet var image: UIImageView!
    
    @IBOutlet var DateandTime: UILabel!
    @IBOutlet var eventName: UILabel!
    
    @IBOutlet var EvenetDescription: UILabel!
    
    static var indexvar: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        image.image = UIImage(named: DataModel.events[EventDetailViewController.indexvar ?? 0].imageURL) ?? UIImage()
        DateandTime.text = DataModel.events[EventDetailViewController.indexvar ?? 0].date.description
        eventName.text = DataModel.events[EventDetailViewController.indexvar ?? 0].title
        EvenetDescription.text = DataModel.events[EventDetailViewController.indexvar ?? 0].description
    }
    
}
