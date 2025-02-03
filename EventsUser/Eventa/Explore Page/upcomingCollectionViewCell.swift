//
//  upcomingCollectionViewCell.swift
//  Eventa
//
//  Created by Jai Khurana on 06/11/24.
//

import UIKit

class upcomingCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var eventImageView: UIImageView!
    
    @IBOutlet weak var eventName: UILabel!
    
    @IBOutlet weak var eventDescription: UILabel!
    
    @IBOutlet weak var dateAndTimeOfEvent: UILabel!
    
    @IBOutlet weak var CostGetTicketButton: UIButton!
    
    @IBOutlet weak var CostLabelUnderLabel: UILabel!
    
    func configure(with event: Event) {
            eventDescription.text = event.description
            eventName.text = event.name
            if let firstImage = event.images.first {
                eventImageView.image = UIImage(named: firstImage)
            }
            eventImageView.layer.cornerRadius = 16
            CostLabelUnderLabel.text = "Cost TBD"
            dateAndTimeOfEvent.text = event.formattedDateTime
        }
    
    
}
