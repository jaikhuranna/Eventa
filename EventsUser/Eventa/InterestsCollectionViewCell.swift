//
//  InterestsViewController.swift
//  Eventa
//
//  Created by Aryan on 18/11/24.
//

import UIKit

class InterestsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var emojiOutlet: UILabel!
    @IBOutlet weak var labelOutlet: UILabel!
    @IBOutlet weak var backgroundViewContainer: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Set default styles for the container view
        backgroundViewContainer?.layer.cornerRadius = 16
        backgroundViewContainer?.layer.masksToBounds = false
        
        // Add shadow
        backgroundViewContainer?.layer.shadowColor = UIColor.black.cgColor
        backgroundViewContainer?.layer.shadowOpacity = 0.1
        backgroundViewContainer?.layer.shadowOffset = CGSize(width: 0, height: 2)
        backgroundViewContainer?.layer.shadowRadius = 4
    }
    
    func configure(name: String, emoji: String) {
        labelOutlet.text = name
        emojiOutlet.text = emoji
    }
    
    func setSelected(_ isSelected: Bool) {
        if isSelected {
            backgroundViewContainer?.backgroundColor = .purple
        } else {
            backgroundViewContainer?.backgroundColor = .white
        }
    }
}
