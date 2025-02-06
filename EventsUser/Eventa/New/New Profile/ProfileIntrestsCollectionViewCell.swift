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
        backroundViewContainer.layer.cornerRadius = 8
        emojiOnlyContainerView.layer.borderWidth = 0.5
        emojiOnlyContainerView.layer.cornerRadius = 8
        emojiOnlyContainerView.layer.borderColor = UIColor.purple.cgColor
    }
}
