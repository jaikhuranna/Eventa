//
//  TagCollectionViewCell.swift
//  Eventa
//
//  Created by Vinod P on 07/11/24.
//


import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var tagLabel: UILabel!

    func configure(with tag: String) {
        tagLabel.text = tag
        tagLabel.backgroundColor = UIColor.purple.withAlphaComponent(0.2)
        tagLabel.layer.cornerRadius = 10
        tagLabel.layer.masksToBounds = true
    }
}
