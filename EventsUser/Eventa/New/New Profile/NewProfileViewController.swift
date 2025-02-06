//
//  NewProfileViewController.swift
//  Eventa
//
//  Created by Jai Khurana on 05/02/25.
//

import UIKit

class NewProfileViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{

    @IBOutlet var imageViewRight: UIImageView!
    @IBOutlet var imageViewLeft: UIImageView!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var totalConnections: UILabel!
    @IBOutlet var eventsAttended: UILabel!
    @IBOutlet var profileImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.layer.cornerRadius = 8
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.setCollectionViewLayout(generateLayout(), animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        DataModel.categories.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "intrestsInProfileCell", for: indexPath)
        let intrest = DataModel.categories[indexPath.row]
        if let cell = cell as? ProfileIntrestsCollectionViewCell {
            cell.emojiLabel.text = intrest.emoji
            cell.IntrestLabel.text = intrest.name
            return cell
        }
        return UICollectionViewCell()
    }
    
    
    func generateLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout{
            (Section, env) -> NSCollectionLayoutSection? in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(100), heightDimension: .absolute(20))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 1)
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            section.interGroupSpacing = 10
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10)
            return section
        }
        return layout }

    
}
