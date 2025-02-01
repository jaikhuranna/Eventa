//
//  InterestsViewController.swift
//  Eventa
//
//  Created by Aryan on 18/11/24.
//

import UIKit

class InterestsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Data for categories
    let categories: [(name: String, emoji: String)] = [
        ("Digital Art", "💻"), ("Community", "🙌"), ("Music & Entertainment", "🎤"), ("Rock", "🎸"),
        ("Health", "💉"), ("Food & drink", "🍟"), ("Family & Education", "👨‍👩‍👧‍👦"),
        ("Sport", "⚽️"), ("Fashion", "👠"), ("Film & Media", "🎞️"),
        ("Home & Lifestyle", "🏡"), ("Design", "🎨"), ("Gaming", "🎮"),
        ("Science & Tech", "🔬"), ("School & Education", "📚"),
        ("Holiday", "⛱️"), ("Travel", "✈️")
    ]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.allowsMultipleSelection = true
    }
    
    // MARK: UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InterestsCollectionViewCell", for: indexPath) as! InterestsCollectionViewCell
        let category = categories[indexPath.row]
        cell.configure(name: category.name, emoji: category.emoji)
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? InterestsCollectionViewCell else { return }
        print("fneifoeif")
        cell.setSelected(true)
        cell.backgroundViewContainer.layer.backgroundColor = CGColor(red: 255, green: 0, blue: 0, alpha: 1);
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? InterestsCollectionViewCell else { return }
        cell.setSelected(false)
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Calculate dynamic width based on text
        let text = categories[indexPath.row].name
        let approximateWidth = text.size(withAttributes: [.font: UIFont.systemFont(ofSize: 16)]).width + 40
        return CGSize(width: approximateWidth, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
}
