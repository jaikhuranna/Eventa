//
//  HomeViewController.swift
//  Eventa
//
//  Created by Jai Khurana on 04/11/24.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.setCollectionViewLayout(UICollectionViewFlowLayout(), animated: true)
        collectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return DataModel.friendsEvents.count
        }
        else if section == 1{
            return DataModel.recommendedEvents.count
        }
        else if section == 2{
            return DataModel.upcomingEvents.count
        }
        else {
            return 0;
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendEventCell", for:indexPath) as! FriendAttendingCollectionViewCell
            let friendEvent = DataModel.friendsEvents[indexPath.row]
            if let cell = cell as? FriendAttendingCollectionViewCell{
                cell.FriendEventName.text = friendEvent.name;
                cell.FriendImageView.image = friendEvent.image;
                cell.FriendEventLocation.text = friendEvent.location;
                cell.FriendEventTime.text = friendEvent.date.description;
            }
            return cell;
        }
        return UICollectionViewCell()
    }
    
    
    func generateLayout() -> UICollectionViewLayout{
        let layout = UICollectionViewCompositionalLayout{
            (section, env)->NSCollectionLayoutSection? in
            
            let sectionType = DataModel.sections[section]
            switch sectionType{
            case .friends, .recommended, .upcoming:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .absolute(240))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 2)
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 10
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
                return section
            }
        }
        return layout
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        DataModel.sections.count;
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
