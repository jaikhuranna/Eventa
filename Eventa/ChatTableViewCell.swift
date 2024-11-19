//
//  chatTableViewCell.swift
//  Eventa
//
//  Created by Aryan on 06/11/24.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    @IBOutlet weak var imageOutlet: UIImageView!
    
    
    @IBOutlet weak var headingLabel: UILabel!
    
    @IBOutlet weak var bodyLabel: UILabel!
    
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
