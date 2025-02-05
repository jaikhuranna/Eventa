//
//  SearchEventsTableViewCell.swift
//  Eventa
//
//  Created by Jai Khurana on 06/02/25.
//

import UIKit

class SearchEventsTableViewCell: UITableViewCell {


    @IBOutlet var eventImage: UIImageView!
    @IBOutlet var EventNamelabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var taglineLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
