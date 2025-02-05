//
//  GalleryCellCollectionViewCell.swift
//  Eventa
//
//  Created by Vinod P on 05/02/25.
//

import UIKit
import SDWebImage

class GalleryCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var downloadButton: UIButton!
    
    var imageUrl: String?
    
    func configure(with image: ImageModel) {
        imageView.sd_setImage(with: URL(string: image.imageUrl), placeholderImage: UIImage(named: "placeholder"))
    }
    
    @IBAction func downloadButtonTapped(_ sender: UIButton) {
        if let url = imageUrl {
            NotificationCenter.default.post(name: Notification.Name("DownloadImage"), object: url)
        }
    }
}
