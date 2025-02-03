struct EventResponse: Decodable {
    let events: [Event]
}

import Foundation

struct Event: Decodable {
    let venue: Venue
    let contactDetails: ContactDetails
    let _id: String
    let name: String
    let description: String
    let category: String
    let organizer: String
    let date: String
    let startTime: String
    let endTime: String
    let maxAttendees: Int
    let attendees: [String]
    let images: [String]
    let status: String
    let tags: [String]
    let createdAt: String

    // Computed property to format the date and time
    var formattedDateTime: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"  // ISO 8601 format
        if let date = dateFormatter.date(from: self.date) {
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .short
            return dateFormatter.string(from: date)
        }
        return "Invalid date"
    }
}

struct Venue: Decodable {
    let name: String
    let address: String
    let city: String
    let state: String
    let pincode: String
    let latitude: Double
    let longitude: Double
}

struct ContactDetails: Decodable {
    let email: String
    let phone: String
    let website: String
}
