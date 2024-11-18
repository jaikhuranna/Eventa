    //
    //  ScreenAfterJoiningViewController.swift
    //  screenAfterJoining
    //
    //  Created by Vinod P on 15/11/24.
    //
import UIKit

class ScreenAfterJoiningViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Array of image names from the Assets folder
    var profileImages = ["profile1", "profile2", "profile3", "profile4","profile5","profile6","profile7","profile8","profile9","profile10","profile11","profile12"]
    
    // Tracks the current index to determine which set of profiles to display
    var currentStartIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         collectionView.dataSource = self
         collectionView.delegate = self
         
         // Explicitly create a UICollectionViewFlowLayout
         let layout = UICollectionViewFlowLayout()
         let spacing: CGFloat = 1
         let numberOfColumns: CGFloat = 2
         
         // Calculate item size based on the collection view's width
         let totalSpacing = (numberOfColumns - 1) * spacing
         let itemWidth = (collectionView.frame.width - totalSpacing) / numberOfColumns
         layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
         
         layout.minimumLineSpacing = spacing
         layout.minimumInteritemSpacing = spacing
         
         // Apply the layout to the collection view
         collectionView.collectionViewLayout = layout
         
    }
    
    // MARK: - Collection View Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Always display 4 profiles at a time
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
        
        // Calculate the correct profile image
        let profileIndex = (currentStartIndex + indexPath.row) % profileImages.count
        let profileImageName = profileImages[profileIndex]
        
        // Set the profile image
        cell.profileImageView.image = UIImage(named: profileImageName)
        
        // Make the image circular
        cell.profileImageView.layer.cornerRadius = cell.profileImageView.frame.size.width / 2
        cell.profileImageView.clipsToBounds = true
        
        return cell
    }
    @IBAction func refreshButtonTapped(_ sender: UIButton) {
        // Animate the collection view to fade out and slide to the left
        UIView.animate(withDuration: 0.3, animations: {
            self.collectionView.alpha = 0.0
            self.collectionView.transform = CGAffineTransform(translationX: -self.collectionView.frame.width, y: 0)
        }) { _ in
            // Update the data source for the next set of profiles
            self.currentStartIndex = (self.currentStartIndex + 4) % self.profileImages.count
            
            // Reload the collection view with new data
            self.collectionView.reloadData()
            
            // Reset the collection view's position and fade it back in with a spring animation
            self.collectionView.transform = CGAffineTransform(translationX: self.collectionView.frame.width, y: 0)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [], animations: {
                self.collectionView.alpha = 1.0
                self.collectionView.transform = .identity
            }, completion: nil)
        }
    }
}

