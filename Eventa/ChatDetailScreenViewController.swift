//
//  ChatDetailScreenViewController.swift
//  Eventa
//
//  Created by Aryan on 18/11/24.
//

import UIKit

class ChatDetailScreenViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let interests = [
        (emoji: "🎵", title: "Vinyl records", rating: "3"),
        (emoji: "🎨", title: "Art", rating: "4"),
        (emoji: "🎹", title: "Music", rating: "4"),
        (emoji: "💻", title: "Blender", rating: "5"),
        (emoji: "🎸", title: "Rock music", rating: "3"),
        (emoji: "📐", title: "3D art", rating: "3")
    ]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "chatDetailInterestCollectionViewCell", for: indexPath) as! ChatDetailInterestsCollectionViewCell
        
        let interest = interests[indexPath.item]
        
        cell.emojiOutlet.text = interest.emoji
        cell.titleOutlet.text = interest.title
        cell.ratingOutlet.image = createRatingImage(rating: interest.rating)
        
        cell.layer.borderWidth = 0.2
        cell.layer.cornerRadius = 15
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 100)
    }
    
    private func createRatingImage(rating: String) -> UIImage? {
        let size = CGSize(width: 30, height: 30)
                UIGraphicsBeginImageContextWithOptions(size, false, 0)
                let context = UIGraphicsGetCurrentContext()

                // Draw Circle
                context?.setFillColor(UIColor.systemGray4.cgColor)
                context?.fillEllipse(in: CGRect(origin: .zero, size: size))

                // Draw Text
                let attributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.boldSystemFont(ofSize: 16),
                    .foregroundColor: UIColor.black
                ]
                let textSize = (rating as NSString).size(withAttributes: attributes)
                let textPoint = CGPoint(x: (size.width - textSize.width) / 2, y: (size.height - textSize.height) / 2)
                (rating as NSString).draw(at: textPoint, withAttributes: attributes)

                let image = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                return image
    }
    
    
    var name: String?

    @IBOutlet weak var nameOutlet: UILabel!
    
    @IBOutlet weak var nameRatedOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameOutlet.text = name
        
        nameRatedOutlet.text = "\(name!) rated your profile"
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }

}
