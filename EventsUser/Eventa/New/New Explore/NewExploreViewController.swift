//
//  NewExploreViewController.swift
//  Eventa
//
//  Created by Jai Khurana on 03/02/25.
//

import UIKit

class NewExploreViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    

    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DataModel.fetchEvents { fetchedEvents in
               DispatchQueue.main.async {
                   DataModel.events = fetchedEvents
                   self.collectionView.reloadData() // Update your UI
               }
           }
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.setCollectionViewLayout( generateLayout(), animated: true)
        
        collectionView.register(
            sectionHeaderCollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "SectionHeader"
        )
    }
    
    @IBAction func joinEventDirectly(_ sender: Any) {
        if let tabBarController = self.tabBarController as? MainTabBarViewController {
//            tabBarController.hideTab(at: 1) // Hides second tab
            tabBarController.restoreTabs()  // Restores original setup
            tabBarController.selectedIndex = 2
            tabBarController.inEvent = true;
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        
        let headerView = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: "SectionHeader",
            for: indexPath
        ) as! sectionHeaderCollectionReusableView
        
        headerView.configure(with: DataModel.SectionHeaders[indexPath.section]) // Use your section titles
        return headerView
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        DataModel.Sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return DataModel.upcomingEvents.count
        } else if section == 1 {
            return DataModel.friendsAttending.count
        } else if (section == 2) {
            return DataModel.ReccomendedEvents.count
        }
        else {
            return 0;
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(String(indexPath.section) + " && " + String(indexPath.row))
        EventDetailsViewController.rowindex = indexPath.row
        EventDetailsViewController.sectionindex = indexPath.section
        performSegue(withIdentifier: "toEventDetails", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let eventsWithFriend = DataModel.friendsAttending[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventsWithYourFriends", for: indexPath) as! EventsWithYourFriendsCollectionViewCell
            if let cell = cell as? EventsWithYourFriendsCollectionViewCell
            {
                cell.eventNameLabel.text = eventsWithFriend.title
                cell.dateLabel.text = eventsWithFriend.date.formatted().substring(to: eventsWithFriend.date.formatted().index(eventsWithFriend.date.formatted().startIndex, offsetBy: 10))
                cell.image.image = UIImage(named: eventsWithFriend.imageURL)
                cell.image.layer.cornerRadius = 10
                cell.joinButton.setTitle("Join", for: .normal)
                cell.locationLabel.text = "Chennai"
                cell.timeLabel.text = eventsWithFriend.date.formatted().substring(from: eventsWithFriend.date.formatted().index(eventsWithFriend.date.formatted().startIndex, offsetBy: 11))
            }
            return cell
        }
        else if (indexPath.section == 1)
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReccomendedEvents", for: indexPath) as! ReccomendedEventsCollectionViewCell
            let reccomendedEvent = DataModel.ReccomendedEvents[indexPath.row]
            if let cell = cell as? ReccomendedEventsCollectionViewCell
            {
                cell.eventNameLabel.text = reccomendedEvent.title
                cell.button.setTitle("Join", for: .normal)
                cell.iamge.layer.cornerRadius = 10
                cell.iamge.image = UIImage(named: reccomendedEvent.imageURL)
                cell.dateNTime.text = reccomendedEvent.date.formatted()
                cell.descriptionLabel.text = reccomendedEvent.description
            }
            return cell
        }
        else if (indexPath.section == 2)
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UpcomingEvents", for: indexPath) as! UpcomingEventsCollectionViewCell
            let UpcomingEvent = DataModel.upcomingEvents[indexPath.row]
            if let cell = cell as? UpcomingEventsCollectionViewCell
            {
                cell.eventNameLabel.text = UpcomingEvent.title
                cell.button.setTitle("Join", for: .normal)
                cell.iamge.layer.cornerRadius = 10
                cell.iamge.image = UIImage(named: UpcomingEvent.imageURL)
                cell.dateNTime.text = UpcomingEvent.date.formatted()
                cell.descriptionLabel.text = UpcomingEvent.description
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
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                section.boundarySupplementaryItems = [header]
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
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                section.boundarySupplementaryItems = [header]
                section.orthogonalScrollingBehavior = .groupPagingCentered
                section.interGroupSpacing = 10
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
                return section
            case .ReccomendedEvents:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95), heightDimension: .fractionalHeight(0.5))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .absolute(230))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 2)
                let section = NSCollectionLayoutSection(group: group)
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                section.boundarySupplementaryItems = [header]
                section.orthogonalScrollingBehavior = .groupPaging
                section.interGroupSpacing = 10
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10)
                return section
            }
        }
        return layout }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
