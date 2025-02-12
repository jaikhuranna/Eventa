//
//  InEventViewController.swift
//  Eventa
//
//  Created by Jai Khurana on 05/02/25.
//

import UIKit

class InEventViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    static var eventToShow: Event?
    
    @IBOutlet var imageVIEW: UIImageView!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var titleEventName: UINavigationItem!
    
    override func viewDidAppear(_ animated: Bool) {
        viewDidLoad()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.setCollectionViewLayout(generateLayout(), animated: true)
        
        imageVIEW.image = UIImage(named: InEventViewController.eventToShow!
            .imageURL)
        imageVIEW.layer.cornerRadius = 20
        titleEventName.title = InEventViewController.eventToShow?.title
    }
    
    @IBAction func exitTabBarButton(_ sender: Any) {
        if let tabBarController = tabBarController as? MainTabBarViewController {
            tabBarController.selectedIndex = 0
            tabBarController.hideTab(at: 2)
            tabBarController.inEvent = false
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let photo = users[indexPath.row].profilePhoto
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "peopleWithIntrestsCell", for: indexPath) as? PeopleWithIntrestsCollectionViewCell {
            cell.imageView.image = photo
            return cell
        }
        return UICollectionViewCell()
    }
    
    
    func generateLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, env) -> NSCollectionLayoutSection? in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0/2.0),
                                                  heightDimension: .fractionalWidth(1.0/2.0)) // Square items
            let item = NSCollectionLayoutItem(layoutSize: itemSize)

            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                   heightDimension: .fractionalWidth(1.0/2.0)) // Match item height
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                           repeatingSubitem: item, count: 2)
            group.interItemSpacing = .fixed(2) // Spacing between items

            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 2 // Spacing between rows
            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 2, bottom: 10, trailing: 2)

            return section
        }
    }
    
}
