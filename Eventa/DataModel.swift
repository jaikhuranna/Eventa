//
//  DataModel.swift
//  Eventa
//
//  Created by Jai Khurana on 28/10/24.
//

import Foundation
import UIKit

struct Event {
    var name: String
    var subTitle: String
    var date = Date()
    var ticketPrice: Double
    var description: String
    var id = UUID()
    var image: UIImage
    var location: String
    
    // Added a custom initializer for convenience
    init(name: String, subTitle: String, date: Date = Date(), ticketPrice: Double, description: String, image: UIImage? = nil, location: String) {
        self.name = name
        self.subTitle = subTitle
        self.date = date
        self.ticketPrice = ticketPrice
        self.description = description
        self.image = image ?? DataModel.defImage // Use defImage if image is nil
        self.location = location
    }
}

class DataModel {
    static var defImage: UIImage = UIImage() // Default placeholder image
    
    // Corrected capitalization of `Section`
    enum Section {
        case friends, recommended, upcoming
    }
    
    static let sections: [Section] = [.friends, .recommended, .upcoming]
    
    static let friendsEvents: [Event] = [
        Event(
            name: "Foo Fighters Concert",
            subTitle: "Foo Fighters are a rock band from Seattle",
            ticketPrice: 20.0,
            description: "This is a concert featuring the Foo Fighters, known for their energetic performances and rock anthems.",
            image: UIImage(named: "Foo") ?? defImage,
            location: "Ghar pe"
        ),
        
        Event(
            name: "India Game Developer Conference (IGDC)",
            subTitle: "India's premier game development event",
            ticketPrice: 150.0,
            description: "The India Game Developer Conference (IGDC) is the biggest and most significant developer event in South Asia, showcasing innovations and networking opportunities in the gaming industry.",
            image: UIImage(named: "IGDC") ?? defImage,
            location: "Ghar pe"
        ),
        
        Event(
            name: "WWDC",
            subTitle: "Apple's Worldwide Developers Conference",
            ticketPrice: 1599.0,
            description: "Apple's annual Worldwide Developers Conference (WWDC) brings developers together to learn about the latest Apple software, tools, and tech.",
            image: UIImage(named: "WWDC") ?? defImage,
            location: "Ghar pe"
        ),
        
        Event(
            name: "Google I/O",
            subTitle: "Google's developer-focused event",
            ticketPrice: 1150.0,
            description: "Google I/O is an annual conference where Google showcases its latest products, developer tools, and technologies.",
            image: UIImage(named: "GoogleIO") ?? defImage,
            location: "Ghar pe"
        ),
        
        Event(
            name: "SXSW Conference & Festivals",
            subTitle: "An interactive conference for creative professionals",
            ticketPrice: 1200.0,
            description: "South by Southwest (SXSW) covers music, film, and interactive media, attracting creative minds from various industries.",
            image: UIImage(named: "SXSW") ?? defImage,
            location: "Ghar pe"
        )
    ]
    
    static let recommendedEvents: [Event] = [
        Event(
            name: "Microsoft Build",
            subTitle: "A developer conference by Microsoft",
            ticketPrice: 1400.0,
            description: "Microsoft Build is a conference for developers focused on Azure, Windows, and developer tools to build solutions for the Microsoft ecosystem.",
            image: UIImage(named: "MicrosoftBuild") ?? defImage,
            location: "Ghar pe"
        ),
        
        Event(
            name: "TED Conference",
            subTitle: "Ideas Worth Spreading",
            ticketPrice: 5000.0,
            description: "The TED Conference brings together inspiring thinkers from around the world to present talks on 'ideas worth spreading'.",
            image: UIImage(named: "TED") ?? defImage,
            location: "Ghar pe"
        )
    ]
    
    static var upcomingEvents: [Event] = friendsEvents + recommendedEvents
}

