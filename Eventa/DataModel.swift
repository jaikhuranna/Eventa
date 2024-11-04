//
//  DataModel.swift
//  Eventa
//
//  Created by Jai Khurana on 28/10/24.
//

import Foundation
import UIKit

struct Event{
    var name: String
    var subTitle: String
    var date: Date
    var ticketPrice: Double
    var description: String
    var id = UUID()
    var image: UIImage
}

class DataModel{
    
    static let Sections : [section] = [.friends, .recomended, .upcoming]
    
    static let friendsEvents: [Event] = [
        Event(
               name: "Foo Fighters Concert",
               subTitle: "Foo Fighters are a rock band from Seattle",
               date: DateFormatter().date(from: "2024-11-02")!,
               ticketPrice: 20.0,
               description: "This is a concert featuring the Foo Fighters, known for their energetic performances and rock anthems.",
               image: UIImage(named: "Foo")!
           ),
           
           Event(
               name: "India Game Developer Conference (IGDC)",
               subTitle: "India's premier game development event",
               date: DateFormatter().date(from: "2024-12-01")!,
               ticketPrice: 150.0,
               description: "The India Game Developer Conference (IGDC) is the biggest and most significant developer event in South Asia, showcasing innovations and networking opportunities in the gaming industry.",
               image: UIImage(named: "IGDC")!
           ),
           
           Event(
               name: "WWDC",
               subTitle: "Apple's Worldwide Developers Conference",
               date: DateFormatter().date(from: "2024-06-03")!,
               ticketPrice: 1599.0,
               description: "Apple's annual Worldwide Developers Conference (WWDC) brings developers together to learn about the latest Apple software, tools, and tech.",
               image: UIImage(named: "WWDC")!
           ),
           
           Event(
               name: "TechCrunch Disrupt",
               subTitle: "A conference for technology innovators",
               date: DateFormatter().date(from: "2024-09-10")!,
               ticketPrice: 1299.0,
               description: "TechCrunch Disrupt is an annual technology conference featuring startups, tech giants, and discussions on the future of innovation.",
               image: UIImage(named: "TechCrunch")!
           ),
           
           Event(
               name: "Google I/O",
               subTitle: "Google's developer-focused event",
               date: DateFormatter().date(from: "2024-05-15")!,
               ticketPrice: 1150.0,
               description: "Google I/O is an annual conference where Google showcases its latest products, developer tools, and technologies.",
               image: UIImage(named: "GoogleIO")!
           ),
           
           Event(
               name: "SXSW Conference & Festivals",
               subTitle: "An interactive conference for creative professionals",
               date: DateFormatter().date(from: "2024-03-08")!,
               ticketPrice: 1200.0,
               description: "South by Southwest (SXSW) covers music, film, and interactive media, attracting creative minds from various industries.",
               image: UIImage(named: "SXSW")!
           )
    ]
    
    static let reccomendedEvents: [Event] = [
        Event(
            name: "Adobe MAX",
            subTitle: "Creativity Conference by Adobe",
            date: DateFormatter().date(from: "2024-10-15")!,
            ticketPrice: 1399.0,
            description: "Adobe MAX is the premier conference for designers, artists, and creators to learn about the latest in digital creativity.",
            image: UIImage(named: "AdobeMAX")!
        ),
        
        Event(
            name: "Microsoft Build",
            subTitle: "A developer conference by Microsoft",
            date: DateFormatter().date(from: "2024-05-23")!,
            ticketPrice: 1400.0,
            description: "Microsoft Build is a conference for developers focused on Azure, Windows, and developer tools to build solutions for the Microsoft ecosystem.",
            image: UIImage(named: "MicrosoftBuild")!
        ),
        
        Event(
            name: "TED Conference",
            subTitle: "Ideas Worth Spreading",
            date: DateFormatter().date(from: "2024-04-14")!,
            ticketPrice: 5000.0,
            description: "The TED Conference brings together inspiring thinkers from around the world to present talks on 'ideas worth spreading'.",
            image: UIImage(named: "TED")!
        ),
        
        Event(
            name: "CES (Consumer Electronics Show)",
            subTitle: "The world's largest tech show",
            date: DateFormatter().date(from: "2024-01-09")!,
            ticketPrice: 300.0,
            description: "CES showcases the latest in consumer electronics, from AI to smart homes to self-driving cars, attracting professionals from around the globe.",
            image: UIImage(named: "CES")!
        )
    ]
    
    static var upcomingEvents: [Event] = friendsEvents + reccomendedEvents;
    
    enum section{
        case friends, recomended, upcoming
    }
}
