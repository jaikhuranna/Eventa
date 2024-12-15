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
    case upcoming, friendsAttending, forYou
}

// MARK: All Tags
enum IntrestTags: String, CaseIterable {
    case Games, Movies, Music, Sports, Travel
}

public struct Event {
    var eventID = UUID()
    var title: String
    var description: String
    var date: Date
    var time: String
    var tagline: String
    var image: String
    var cost: Double // New field for event cost
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
    
    static let SectionTitles = ["Upcoming", "Friends Attending"]
    
    static let Sections: [Section] = [.upcoming, .friendsAttending]
    
    static var upcomingEvents: [Event] { DataModel.events }

    static var friendsAttending: [Event] { DataModel.events }
    
    static let db = Firestore.firestore()
    
    static func saveEvent(event: Event) {
           let eventRef = db.collection("events").document(event.eventID.uuidString)
           eventRef.setData([
               "title": event.title,
               "description": event.description,
               "date": event.date,
               "tagline": event.tagline,
               "image": event.image,
               "cost": event.cost,
               "icebreakerQuestions": event.icebreakerQuestions
           ]) { error in
               if let error = error {
                   print("Error saving event: \(error)")
               } else {
                   print("Event saved successfully")
               }
           }
       }
    
    static func fetchEvents(completion: @escaping ([Event]) -> Void) {
        db.collection("events").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error fetching events: \(error)")
                completion([])
                return
            }
            
            var events = [Event]()
            for document in querySnapshot!.documents {
                let data = document.data()
                let event = Event(
                    eventID: UUID(uuidString: document.documentID) ?? UUID(),
                    title: data["title"] as? String ?? "",
                    description: data["description"] as? String ?? "",
                    date: (data["date"] as? Timestamp)?.dateValue() ?? Date(),
                    time: "", // Time can be calculated if needed
                    tagline: data["tagline"] as? String ?? "",
                    image: data["image"] as? String ?? "",
                    cost: data["cost"] as? Double ?? 0.0,
                    icebreakerQuestions: data["icebreakerQuestions"] as? [String] ?? []
                )
                events.append(event)
            }
            completion(events)
        }
    }
}

