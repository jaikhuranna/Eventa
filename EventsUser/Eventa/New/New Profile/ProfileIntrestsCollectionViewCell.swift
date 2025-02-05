//
//  ProfileIntrestsCollectionViewCell.swift
//  Eventa
//
//  Created by Jai Khurana on 05/02/25.
//

import UIKit

class ProfileIntrestsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var backroundViewContainer: UIView!
    @IBOutlet var emojiOnlyContainerView: UIView!
    @IBOutlet var emojiLabel: UILabel!
    @IBOutlet var IntrestLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        backroundViewContainer.layer.cornerRadius = 12
        emojiOnlyContainerView.layer.borderWidth = 1
        emojiOnlyContainerView.layer.cornerRadius = 12
        emojiOnlyContainerView.layer.borderColor = UIColor.purple.cgColor
        
    }
}
