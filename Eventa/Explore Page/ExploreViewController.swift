//
//  HomeViewController.swift
//  Eventa
//
//  Created by Jai Khurana on 06/11/24.
//

import UIKit
import CoreLocation

class ExploreViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        locationLabel.text = "Chennai"
        collectionView.dataSource = self
        collectionView.setCollectionViewLayout( generateLayout(), animated: true)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        DataModel.Sections.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return DataModel.Events.count
        } else if section == 1 {
            return DataModel.Events.count
        } else  {
            return 0;
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (indexPath.section == 0){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UpcomingEventCell", for: indexPath)
            let upcomingEvent = DataModel.Events[indexPath.row]
            if let cell = cell as? upcomingCollectionViewCell{
                cell.eventDescription.text = upcomingEvent.description
                cell.eventName.text = upcomingEvent.title
                cell.eventImageView.image = UIImage(named: upcomingEvent.image)
                cell.eventImageView.layer.cornerRadius = 16
                cell.CostLabelUnderLabel.text = String(upcomingEvent.cost)
                cell.dateAndTimeOfEvent.text = upcomingEvent.date.description
            }
            return cell
        } else if (indexPath.section == 1) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeeWhereYourFriendsAreGoingEventCell", for: indexPath)
            let SeeWhereYourFriendsAreGoingEvent = DataModel.Events[indexPath.row]
            if let cell =  cell as? SeeWhereYourFriendsAreGoingEventCellCollectionViewCell{
//                cell.FriendCellBaseUIView.layer.maskedCorners = CACornerMask(rawValue: )
                cell.FriendCellEventCostButtonLabel.text = String(SeeWhereYourFriendsAreGoingEvent.cost)
                cell.FriendCellEventDataLabel.text = SeeWhereYourFriendsAreGoingEvent.date.description;
                cell.FriendCellEventNameLabel.text = SeeWhereYourFriendsAreGoingEvent.title;
                cell.FriendCellEventTimeLabel.text = SeeWhereYourFriendsAreGoingEvent.time.description;
                cell.FriendsViewImageView.image = UIImage(named: SeeWhereYourFriendsAreGoingEvent.image)
//                cell.FriendsViewImageView.layer.cornerRadius
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
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .absolute(230))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 2)
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPaging
                section.interGroupSpacing = 10
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10)
                return section
            case .friendsAttending:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.87), heightDimension: .absolute(271))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count:1)
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                section.interGroupSpacing = 10
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
                return section
            default:
                return nil
            }
        }
        return layout
    }
    
}
