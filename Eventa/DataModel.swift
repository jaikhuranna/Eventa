//
//  DataModel.swift
//  Eventa
//
//  Created by Jai Khurana on 28/10/24.
//

import Foundation


enum Section {
    case upcoming, friendsAttending, forYou
}
struct Event {
    var eventID = UUID()
    var title: String
    var description: String
    var date: Date
    var time: String
    var tagline: String
    var image: String

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
class DataModel{
    
    static let Sections: [Section] = [.upcoming]
    
    static let upcomingEvents : [Event] = [
        Event( title: "IGDC 2024", description: "India Game Developers Conference 2024, showcasing the latest in game development.", date: createDate(from: "2024-12-05 09:00:00") ?? Date(), time: "9:00 AM", tagline: "The future of gaming is here!", image: "IGDC"),
        Event( title: "WWDC 2024", description: "Apple's Worldwide Developers Conference 2024, featuring major updates and announcements for iOS, macOS, and more.", date: createDate(from: "2024-06-03 10:00:00") ?? Date(), time: "10:00 AM", tagline: "Revolutionizing the future of tech.", image: "WWDC"),
        Event( title: "Nirvana Live and Loud", description: "Nirvana Live and Loud is everything music is and everything that it's not. It's a celebration of music, a celebration of life, and a celebration of the future.", date: createDate(from: "2024-05-15 09:30:00") ?? Date(), time: "9:30 AM", tagline: "Montage of Heck", image: "NIRVANA"),
        
        Event( title: "TED", description: "TED Conferences, LLC (Technology, Entertainment, Design[7]) is an American-Canadian non-profit[7] media organization that posts international talks online for free distribution under the slogan ideas worth spreading", date: createDate(from: "2024-11-20 08:00:00") ?? Date(), time: "8:00 AM", tagline: "From beginner to pro!", image: "TED"),
        Event( title: "Foo Fighters consert", description: "A celebration of music featuring Foo Fighters, We fight foo for you!", date: createDate(from: "2024-08-01 18:00:00") ?? Date(), time: "6:00 PM", tagline: "Everlong", image: "Foo"),
        Event( title: "Food & Wine Expo", description: "A food lover’s paradise featuring top chefs, wine tasting, and gourmet food stalls.", date: createDate(from: "2024-09-10 11:00:00") ?? Date(), time: "11:00 AM", tagline: "Taste the best!", image: "SXSW"),
        
    ]
    
}
