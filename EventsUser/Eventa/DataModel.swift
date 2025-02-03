//
//  DataModel.swift
//  Eventa
//
//  Created by Jai Khurana on 28/10/24.
//

import Foundation
import FirebaseFirestore

// MARK: Types of Events
enum Section {
    case friendsAttending, ReccomendedEvents, upcoming
}

// MARK: All Tags
enum IntrestTags: String, CaseIterable {
    case Games, Movies, Music, Sports, Travel
}

public struct OldEvent {
    var eventID = UUID()
    var title: String
    var description: String
    var date: Date
    var time: String
    var tagline: String
    var imageURL: String
    var cost: Int // New field for event cost
    var icebreakerQuestions: [String] // Questions for attendees

    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }

    func formattedTime() -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

func createDate(from string: String) -> Date? {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    return formatter.date(from: string)
}

class DataModel {
    
    
    static var events = [Event]()
    
    static let SectionHeaders: [String] = ["Events with your friends", "For you","Upcoming"]
    
    static let Sections: [Section] = [.friendsAttending, .ReccomendedEvents, .upcoming]
    
    static var upcomingEvents: [Event] { DataModel.events }

    static var friendsAttending: [Event] { DataModel.events }
    
    static var ReccomendedEvents: [Event] { DataModel.events }

    static let db = Firestore.firestore()
    
//    static func saveEvent(event: Event) {
//         let eventRef = db.collection("events").document(event.eventID.uuidString)
//         eventRef.setData([
//             "title": event.title,
//             "description": event.description,
//             "date": event.date,
//             "tagline": event.tagline,
//             "image": event.imageURL,
//             "cost": event.cost,
//             "icebreakerQuestions": event.icebreakerQuestions
//         ]) { error in
//             if let error = error {
//                 print("Error saving event: \(error)")
//             } else {
//                 print("Event saved successfully")
//             }
//         }
//     }
    
//    static func fetchEvents(completion: @escaping ([Event]) -> Void) {
//        db.collection("events").getDocuments { (querySnapshot, error) in
//            if let error = error {
//                print("Error fetching events: \(error)")
//                completion([])
//                return
//            }
//            
//            events = [Event]()
//            for document in querySnapshot!.documents {
//                let data = document.data()
//                let event = Event(
//                    eventID: UUID(uuidString: document.documentID) ?? UUID(),
//                    title: data["title"] as? String ?? "",
//                    description: data["description"] as? String ?? "",
//                    date: (data["date"] as? Timestamp)?.dateValue() ?? Date(),
//                    time: "", // Time can be calculated if needed
//                    tagline: data["tagline"] as? String ?? "",
//                    imageURL: data["image"] as? String ?? "",
//                    cost: data["cost"] as? Int ?? 0,
//                    icebreakerQuestions: data["icebreakerQuestions"] as? [String] ?? []
//                )
//                events.append(event)
//            }
//            completion(events)
//        }
//    }
    
    
    public struct Chat {
        var senderName: String
        var message: String
        var imageURL: String
        var timestamp: String
    }
    
    static var fetchedChats = [Chat]()
    
    static func saveChats(names: [String], messages: [String], timeData: [String]) {
        let chatsCollection = db.collection("chats")

        for index in 0..<names.count {
            let name = names[index]
            let message = messages[index]
            let time = timeData[index]
            let imageURL = "Profile image" // Since images are not being uploaded yet.

            // Prepare the chat data
            let chatData: [String: Any] = [
                "senderName": name,
                "message": message,
                "imageURL": imageURL,
                "timestamp": time
            ]

            // Save chat data to Firestore
            chatsCollection.addDocument(data: chatData) { error in
                if let error = error {
                    print("Error saving chat: \(error)")
                } else {
                    print("Chat saved successfully: \(name)")
                }
            }
        }
    }
    
    static func fetchChats(completion: @escaping () -> Void) {
        db.collection("chats").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error fetching chats: \(error)")
                completion()  // Return after failure
                return
            }
            
            fetchedChats = querySnapshot?.documents.compactMap { document in
                let data = document.data()
                let name = data["name"] as? String ?? ""
                let message = data["message"] as? String ?? ""
                let imageURL = data["imageURL"] as? String ?? ""
                let time = data["time"] as? String ?? ""
                
                // Create a Chat object for each document and return
                return Chat(senderName: name, message: message, imageURL: imageURL, timestamp: time)
            } ?? []
            
            completion()  // Return when fetching is complete
        }
    }
}

