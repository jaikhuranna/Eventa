//
//  finalEventDataCheckViewController.swift
//  Eventa Organiser
//
//  Created by Jai Khurana on 15/12/24.
//

import UIKit

class finalEventDataCheckViewController: UIViewController {

    @IBOutlet var addEventButton: UIButton!
    @IBOutlet var finalImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var costLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var taglineLabel: UILabel!
    @IBOutlet var startDateLabel: UILabel!
    @IBOutlet var endDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        finalImage.image = AddImageViewController.imageToSend
        titleLabel.text = AddEventViewController.eventTitle
        costLabel.text = String(AddEventViewController.eventCost)
        descriptionLabel.text = AddEventViewController.eventDescription
        taglineLabel.text = AddEventViewController.eventTagline
        startDateLabel.text = AddEventViewController.eventStartDate.formatted()
        endDateLabel.text = AddEventViewController.eventEndDate.formatted()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressAddEventButton(_ sender: Any) {
        DataHandler.saveEvent(event: DataHandler.Event(
            title: titleLabel.text ?? "no title" ,
            description: descriptionLabel.text ?? "",
            date: AddEventViewController.eventEndDate,
            time: startDateLabel.text ?? "No date" ,
            tagline: taglineLabel.text ?? "tagline not found",
            image: "Image",
            cost: Int(costLabel.text ?? "0") ?? 0,
            icebreakerQuestions: [String()]))
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
