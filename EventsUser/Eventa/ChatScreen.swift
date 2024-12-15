//
//  ChatScreen.swift
//  Eventa
//
//  Created by Aryan on 06/11/24.
//

import UIKit

class ChatScreen: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataModel.fetchChats {
            DispatchQueue.main.async {
                self.tableView.reloadData()  // Or collectionView.reloadData()
            }
        }

        
        let nib = UINib(nibName: "ChatTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ChatTableViewCell")

        tableView.delegate = self
        tableView.dataSource = self
    }

}
extension ChatScreen: UITableViewDelegate, UITableViewDataSource {
    
    //Delegates
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedUser = users[indexPath.row].name
        
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "ChatDetailScreen") as? ChatDetailScreenViewController else { return }
        
        detailVC.name = selectedUser
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataModel.fetchedChats.count
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatTableViewCell", for: indexPath) as! ChatTableViewCell
//        
//        cell.headingLabel?.text = users[indexPath.row].name
//        
//        cell.bodyLabel?.text =  messages[indexPath.row]
//
////        cell.imageOutlet.image = images[indexPath.row]
//        
//        cell.imageOutlet.image = users[indexPath.row].profilePhoto
//        
//        cell.timeLabel?.text = DataModel.timeData[indexPath.row]
//        
//        cell.imageOutlet.layer.cornerRadius = cell.imageOutlet.frame.size.width / 2
//        
//        cell.imageOutlet.clipsToBounds = true
//        
//        return cell
//    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatTableViewCell", for: indexPath) as! ChatTableViewCell
        
        // Access the chat from the fetchedChats array at the given index
        let chat = DataModel.fetchedChats[indexPath.row]
        
        // Set the UI elements based on the properties of the Chat object
        cell.headingLabel?.text = chat.senderName
        cell.bodyLabel?.text = chat.message
        cell.imageOutlet.image = UIImage(named: chat.imageURL)  // Assuming profilePhoto is part of the Chat object
        cell.timeLabel?.text = chat.timestamp
        
        // Round the profile image
        cell.imageOutlet.layer.cornerRadius = cell.imageOutlet.frame.size.width / 2
        cell.imageOutlet.clipsToBounds = true
        
        return cell
    }

}
