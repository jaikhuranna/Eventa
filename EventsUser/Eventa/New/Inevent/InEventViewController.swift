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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.setCollectionViewLayout(generateLoyout(), animated: true)
        
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
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "peopleWithIntrestsCell", for: indexPath) as? PeopleWithIntrestsCollectionViewCell {
            let curvedTextView = CurvedTextView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
            cell.baseViewContainer.addSubview(curvedTextView)
            curvedTextView.center = cell.baseViewContainer.center
            return cell
        }
        return UICollectionViewCell()
    }
    
    func generateLoyout() -> UICollectionViewFlowLayout {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.itemSize = CGSize(width: 200, height: 150)
        layout.minimumInteritemSpacing = 20
        return layout
    }
    
}
