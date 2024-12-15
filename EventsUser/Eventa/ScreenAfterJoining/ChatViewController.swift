//
//  ChatViewController.swift
//  screenAfterJoining
//
//  Created by Vinod P on 18/11/24.
//

import UIKit
import MessageKit

struct Sender: SenderType{
    var senderId: String
    var displayName: String
}

struct Message: MessageType{
    var sender: any MessageKit.SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKit.MessageKind
    
}

class ChatViewController: MessagesViewController, MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate  {
    
    var currentSender: any MessageKit.SenderType = Sender(senderId: "self", displayName: "Me")
    
    //users of chat:
    let otherUser = Sender(senderId: "other", displayName: "Madhu")
    let otherUser2 = Sender(senderId: "other2", displayName: "Niharika")
    
    
    var messages = [MessageType]()
    override func viewDidLoad() {
        super.viewDidLoad()
        //messages that will appear
        messages.append(Message(sender: currentSender,
                                messageId: "1",
                                sentDate: Date().addingTimeInterval(-86400),
                                kind: .text("Hi! Im so excited for this event")))
        messages.append(Message(sender: otherUser,
                                messageId: "2",
                                sentDate: Date().addingTimeInterval(-85000),
                                kind: .text("Me too! I have been looking forward for this event for a long time")))
        messages.append(Message(sender: otherUser,
                                messageId: "3",
                                sentDate: Date().addingTimeInterval(-70000),
                                kind: .text("Does anyone know who the special guest is?")))
        messages.append(Message(sender: otherUser2,
                                messageId: "4",
                                sentDate: Date().addingTimeInterval(-66400),
                                kind: .text("They have kept it super scerect!")))
        messages.append(Message(sender: currentSender,
                                messageId: "5",
                                sentDate: Date().addingTimeInterval(-56400),
                                kind: .text("The special guest is from Bangalore I heard!")))
        
        // Do any additional setup after loading the view.
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
    }

    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessageKit.MessagesCollectionView) -> any MessageKit.MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessageKit.MessagesCollectionView) -> Int {
        return messages.count
    }
    func messageTopLabelAttributedText(for message: MessageType, at indexPath: IndexPath) -> NSAttributedString? {
            let dateFormatter = DateFormatter()

            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .short

            let dateText = dateFormatter.string(from: message.sentDate)
            return NSAttributedString(string: dateText, attributes: [.font: UIFont.systemFont(ofSize: 10), .foregroundColor: UIColor.gray])
        }

}


