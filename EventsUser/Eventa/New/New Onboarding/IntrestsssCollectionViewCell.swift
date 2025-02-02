//
//  IntrestsssCollectionViewCell.swift
//  Eventa
//
//  Created by Jai Khurana on 02/02/25.
//

import UIKit

class IntrestsssCollectionViewCell: UICollectionViewCell {
    @IBOutlet var emojiLabel: UILabel!
    
    @IBOutlet var intrestLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 12
        layer.borderWidth = 1
        layer.backgroundColor = UIColor.white.cgColor
        layer.borderColor = UIColor.clear.cgColor
        
    }
    override var isSelected: Bool {
        didSet {
            UIView.animate(withDuration: 0.2) {
                self.backgroundColor = self.isSelected ? UIColor.systemPurple.withAlphaComponent(0.2) : UIColor.white
                self.layer.borderColor = self.isSelected ? UIColor.systemPurple.cgColor : UIColor.clear.cgColor
                self.intrestLabel.textColor = self.isSelected ? UIColor.systemPurple : UIColor.black
                self.emojiLabel.textColor = self.isSelected ? UIColor.systemPurple : UIColor.black
            }
        }
    }
}
