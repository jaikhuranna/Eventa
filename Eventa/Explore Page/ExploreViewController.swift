//
//  HomeViewController.swift
//  Eventa
//
//  Created by Jai Khurana on 06/11/24.
//

import UIKit
import CoreLocation

class ExploreViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        locationLabel.text = "Chennai"
        collectionView.dataSource = self
        collectionView.setCollectionViewLayout( generateLayout(), animated: true)
//        collectionView.
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return DataModel.upcomingEvents.count
        } else {
            return 0;
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (indexPath.section == 0){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UpcomingEventCell", for: indexPath)
            let upcomingEvent = DataModel.upcomingEvents[indexPath.row]
            if let cell = cell as? upcomingCollectionViewCell{
                cell.eventDescription.text = upcomingEvent.description
                cell.eventName.text = upcomingEvent.title
                cell.eventImageView.image = UIImage(named: upcomingEvent.image)
                cell.eventImageView.layer.cornerRadius = 16
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    func generateLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout{
            (Section, env) -> NSCollectionLayoutSection? in
            
            let sectionType = DataModel.Sections[Section]
            switch sectionType {
            case .upcoming:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95), heightDimension: .fractionalHeight(0.5))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .absolute(220))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 2)
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPaging
                section.interGroupSpacing = 10
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10)
                return section
            default:
                return nil
            }
        }
        return layout
    }
    
}
