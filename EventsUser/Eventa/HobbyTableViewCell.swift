//
//  HobbyTableViewCell.swift
//  Eventa
//
//  Created by Vinod P on 07/11/24.
//

import UIKit

import UIKit

class HobbyTableViewCell: UITableViewCell {
    @IBOutlet weak var hobbyImageView: UIImageView!
    @IBOutlet weak var hobbyDescriptionLabel: UILabel!

    func configure(with hobby: Hobby) {
        hobbyImageView.image = hobby.photo
        hobbyDescriptionLabel.text = hobby.description
    }
}

