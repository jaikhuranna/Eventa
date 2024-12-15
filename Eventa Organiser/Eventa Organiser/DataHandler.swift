//
//  DataHandler.swift
//  Eventa Organiser
//
//  Created by Jai Khurana on 15/12/24.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage

class DataHandler {
    
    public struct Event {
        var eventID = UUID()
        var title: String
        var description: String
        var date: Date
        var time: String
        var tagline: String
        var imageURL: String
        var cost: Int
        var icebreakerQuestions: [String]
    }
    
    static var db = Firestore.firestore()

    static func saveEvent(event: Event) {
         let eventRef = db.collection("events").document(event.eventID.uuidString)
         eventRef.setData([
             "title": event.title,
             "description": event.description,
             "date": event.date,
             "tagline": event.tagline,
             "image": event.imageURL,
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

    private static func saveEventToFirestore(event: Event, eventRef: DocumentReference) {
        eventRef.setData([
            "title": event.title,
            "description": event.description,
            "date": event.date,
            "tagline": event.tagline,
            "image": event.imageURL,
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

    
}
