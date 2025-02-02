//
//  OnboardIntrestsViewController.swift
//  Eventa
//
//  Created by Jai Khurana on 02/02/25.
//

import UIKit

class OnboardIntrestsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var collectionView: UICollectionView!
    
    
    var selectedInterests: Set<Int> = []

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.allowsMultipleSelection = true

        
//        collectionView.setCollectionViewLayout(generateLayout(), animated: true)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func endOnboarding(_ sender: Any) {
        dismiss(animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        NewDataModel.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let category = NewDataModel.categories[indexPath.item]
        if let cell = cell as? IntrestsssCollectionViewCell {
            cell.emojiLabel.text = category.emoji
            cell.intrestLabel.text = category.name
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedInterests.insert(indexPath.item)
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        selectedInterests.remove(indexPath.item)
    }

//    func generateLayout() -> UICollectionViewLayout {
//            let layout = UICollectionViewFlowLayout()
//        layout.sectionInset = .zero
//        layout.itemSize = CGSize(width: view.frame.width / 3, height: view.frame.width / 3)
//        layout.minimumLineSpacing = 0
//        layout.minimumInteritemSpacing = 0
//        return layout
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Calculate dynamic width based on text
        let text = NewDataModel.categories[indexPath.row].name
        let approximateWidth = text.size(withAttributes: [.font: UIFont.systemFont(ofSize: 16)]).width + 10
        return CGSize(width: approximateWidth, height: 20)
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
