//
//  DataModel.swift
//  Eventa
//
//  Created by Jai Khurana on 28/10/24.
//

import Foundation

// MARK: Types of Events
enum Section {
    case upcoming, friendsAttending, forYou
}

// MARK: All Tags
enum IntrestTags: String, CaseIterable {
    case Games, Movies, Music, Sports, Travel
}

struct Event {
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
    
    static let SectionTitles = ["Upcoming", "Friends Attending"]
    
    static let Sections: [Section] = [.upcoming, .friendsAttending]
    
    static let Events: [Event] = [
        Event(
            title: "IGDC 2024",
            description: "India Game Developers Conference 2024, showcasing the latest in game development.",
            date: createDate(from: "2024-12-05 09:00:00") ?? Date(),
            time: "9:00 AM",
            tagline: "The future of gaming is here!",
            image: "IGDC",
            cost: 250.00,
            icebreakerQuestions: [
                "Are you a game developer or just a gaming enthusiast? What excites you the most about this conference?",
                "Have you attended IGDC before? How does this year compare?",
                "Which session or speaker are you most looking forward to?",
                "Are you working on a game right now? Can you share some details?"
            ]
        ),
        Event(
            title: "WWDC 2024",
            description: "Apple's Worldwide Developers Conference 2024, featuring major updates and announcements for iOS, macOS, and more.",
            date: createDate(from: "2024-06-03 10:00:00") ?? Date(),
            time: "10:00 AM",
            tagline: "Revolutionizing the future of tech.",
            image: "WWDC",
            cost: 1599.00,
            icebreakerQuestions: [
                "Are you a developer working in the Apple ecosystem, or are you here to explore?",
                "What feature or announcement are you hoping to see this year?",
                "Have you ever published an app on the App Store? What was the experience like?",
                "Which platform—iOS, macOS, or watchOS—do you enjoy working on the most?"
            ]
        ),
        Event(
            title: "Nirvana Live and Loud",
            description: "Nirvana Live and Loud is everything music is and everything that it's not. It's a celebration of music, a celebration of life, and a celebration of the future.",
            date: createDate(from: "2024-05-15 09:30:00") ?? Date(),
            time: "9:30 AM",
            tagline: "Montage of Heck",
            image: "NIRVANA",
            cost: 100.00,
            icebreakerQuestions: [
                "Are you a longtime fan of Nirvana, or are you discovering their music now?",
                "What’s your favorite Nirvana song or album?",
                "Have you been to other live music events recently?",
                "What do you love most about live concerts?"
            ]
        ),
        Event(
            title: "TED",
            description: "TED Conferences, LLC (Technology, Entertainment, Design) is an American-Canadian non-profit media organization that posts international talks online for free distribution under the slogan ideas worth spreading",
            date: createDate(from: "2024-11-20 08:00:00") ?? Date(),
            time: "8:00 AM",
            tagline: "From beginner to pro!",
            image: "TED",
            cost: 500.00,
            icebreakerQuestions: [
                "What inspired you to attend this TED conference?",
                "Is there a specific speaker or topic you’re particularly excited about?",
                "Have you watched TED Talks online before? Which one left the biggest impact on you?",
                "If you could give a TED Talk, what would your topic be?"
            ]
        ),
        Event(
            title: "Foo Fighters Concert",
            description: "A celebration of music featuring Foo Fighters, We fight foo for you!",
            date: createDate(from: "2024-08-01 18:00:00") ?? Date(),
            time: "6:00 PM",
            tagline: "Everlong",
            image: "Foo",
            cost: 75.00,
            icebreakerQuestions: [
                "What’s your favorite Foo Fighters song?",
                "Have you seen them live before, or is this your first time?",
                "What’s your favorite concert experience so far?",
                "What do you think makes Foo Fighters’ music so special?"
            ]
        ),
        Event(
            title: "Food & Wine Expo",
            description: "A food lover’s paradise featuring top chefs, wine tasting, and gourmet food stalls.",
            date: createDate(from: "2024-09-10 11:00:00") ?? Date(),
            time: "11:00 AM",
            tagline: "Taste the best!",
            image: "SXSW",
            cost: 120.00,
            icebreakerQuestions: [
                "Are you here for the food, the wine, or both?",
                "Have you tried anything yet? What’s been your favorite so far?",
                "Do you enjoy cooking or wine tasting at home?",
                "Have you been to any other food festivals recently?"
            ]
        )
    ]
    
    static let upcomingEvents: [Event] = Events
    
    static let friendsAttending: [Event] = Events
}
