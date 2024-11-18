//
//  ChatScreen.swift
//  Eventa
//
//  Created by Aryan on 06/11/24.
//

import UIKit

class ChatScreen: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let names = [
        "Aryan Kacker",
        "Tanya Kacker",
        "Shruti Kacker",
        "Anuj Kacker",
        "Riya Sharma",
        "Karan Mehta",
        "Simran Patel",
        "Vikram Singh",
        "Priya Joshi",
        "Rajesh Verma",
        "Neha Gupta",
        "Arjun Roy",
        "Aditi Chawla",
        "Rohit Khanna",
        "Sneha Rao",
        "Aman Sethi",
        "Kavya Malhotra",
        "Mohan Desai",
        "Anjali Shah",
        "Nikhil Bhatia"
    ]

    let messages = [
        "Hello, how are you?",
        "Let's catch up soon!",
        "Hope you're doing well.",
        "Don't forget to call me.",
        "Can we meet tomorrow?",
        "Happy to hear from you!",
        "It's been a while, let's chat.",
        "How's everything going?",
        "Let's plan for the weekend.",
        "I need your help with something.",
        "Hope you had a great day!",
        "Just checking in, hope all is well.",
        "Miss you, let's talk soon.",
        "What have you been up to?",
        "I was thinking about you today.",
        "Hope you're having a good day.",
        "Can't wait to see you soon.",
        "Have a great evening!",
        "Take care and stay safe.",
        "Let's get together sometime."
    ]

    let images: [UIImage] = [
        UIImage(named: "Profile image")!,
        UIImage(named: "Profile image")!,
        UIImage(named: "Profile image")!,
        UIImage(named: "Profile image")!,
        UIImage(named: "Profile image")!,
        UIImage(named: "Profile image")!,
        UIImage(named: "Profile image")!,
        UIImage(named: "Profile image")!,
        UIImage(named: "Profile image")!,
        UIImage(named: "Profile image")!,
        UIImage(named: "Profile image")!,
        UIImage(named: "Profile image")!,
        UIImage(named: "Profile image")!,
        UIImage(named: "Profile image")!,
        UIImage(named: "Profile image")!,
        UIImage(named: "Profile image")!,
        UIImage(named: "Profile image")!,
        UIImage(named: "Profile image")!,
        UIImage(named: "Profile image")!,
        UIImage(named: "Profile image")!
    ]
    
    let timeData = [
        "07:16 PM",
        "05:26 PM",
        "08:28 AM",
        "09:41 PM",
        "07:18 PM",
        "09:07 PM",
        "08:32 PM",
        "11:09 AM",
        "10:14 AM",
        "08:07 AM",
        "09:39 PM",
        "04:11 AM",
        "01:02 PM",
        "03:00 AM",
        "04:07 AM",
        "08:34 AM",
        "07:11 AM",
        "09:54 PM",
        "04:51 PM",
        "08:11 AM"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "ChatTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ChatTableViewCell")

        tableView.delegate = self
        tableView.dataSource = self
    }

}
extension ChatScreen: UITableViewDelegate, UITableViewDataSource {
    
    //Delegates
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped me!")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatTableViewCell", for: indexPath) as! ChatTableViewCell
        
        cell.headingLabel?.text = names[indexPath.row]
        
        cell.bodyLabel?.text = messages[indexPath.row]
        
        cell.imageOutlet.image = images[indexPath.row]
        
        cell.timeLabel?.text = timeData[indexPath.row]
        
        cell.imageOutlet.layer.cornerRadius = cell.imageOutlet.frame.size.width / 2
        
        cell.imageOutlet.clipsToBounds = true
        
        return cell
    }
}
