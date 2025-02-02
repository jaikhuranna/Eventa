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
    
}
