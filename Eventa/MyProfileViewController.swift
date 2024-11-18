//
//  MyProfileViewController.swift
//  Eventa
//
//  Created by Vinod P on 07/11/24.
//

import UIKit


class myProfileViewController: UIViewController, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    // Outlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageGenderLabel: UILabel!
    @IBOutlet weak var interestTagsCollectionView: UICollectionView!
    @IBOutlet weak var hobbiesTableView: UITableView!
    
    // Data
    var user: EventaUser = users[0] // Replace with actual user data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up CollectionView and TableView
        interestTagsCollectionView.dataSource = self
        hobbiesTableView.delegate = self
        hobbiesTableView.dataSource = self
        
        // Load user data into UI
        loadUserData()
    }
    
    func loadUserData() {
        profileImageView.image = user.profilePhoto
        nameLabel.text = user.name
        ageGenderLabel.text = "\(user.age) • \(user.gender)"
    }
    
    // MARK: - CollectionView DataSource for Interest Tags
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return user.interestTags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCell", for: indexPath) as! TagCollectionViewCell
        cell.configure(with: user.interestTags[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath:
     IndexPath) -> CGSize {
        
      let width = 300// Replace with your desired width
      let height = 300 // Replace with your desired height
      return CGSize(width: width, height: height)
    }
    
    // MARK: - TableView DataSource and Delegate for Hobbies
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.hobbies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HobbyCell", for: indexPath) as! HobbyTableViewCell
        let hobby = user.hobbies[indexPath.row]
        cell.configure(with: hobby)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
