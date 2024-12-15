//
//  UserDatamodel.swift
//  Eventa
//
//  Created by Vinod P on 06/11/24.
//
// UserDatamodel consists of users 0 .. 12
// Users 0 is Jai, he is our user of the app(home)
// all other users are the users that will be displayed for Jai

import Foundation
import UIKit

struct EventaUser {
    var usernumber: Int
    var name: String
    var age: Int
    var gender: String
    var profilePhoto: UIImage
    var interestTags: [String]
    var hobbies: [Hobby]
    var tagline: String
}

struct Hobby {
    var description: String
    var photo: UIImage
}

let users: [EventaUser] = [
    EventaUser(
        usernumber: 0,
        name: "Jai Khurana",
        age: 20,
        gender: "Male",
        profilePhoto: UIImage(named: "profile0") ?? UIImage(),
        interestTags: ["Music", "Video Games", "Travel", "Techie", "Novels", "Art"],
        hobbies: [
            Hobby(description: "I love old classic music, from punk, rock to jazz", photo: UIImage(named: "hobbyPhoto1") ?? UIImage()),
            Hobby(description: "Exploring digital art and patterns.", photo: UIImage(named: "hobbyPhoto2") ?? UIImage())
        ],
        tagline: "Retro Music • 3D Art"
    ),
    EventaUser(
        usernumber: 1,
        name: "Yashika Jatav",
        age: 22,
        gender: "Female",
        profilePhoto: UIImage(named: "profile1") ?? UIImage(),
        interestTags: ["Art","Novels","Photography", "Travel", "Cooking", "Baking"],
        hobbies: [
            Hobby(description: "Capturing moments, one click at a time.", photo: UIImage(named: "hobbyPhoto3") ?? UIImage()),
            Hobby(description: "Baking delicious treats for friends and family.", photo: UIImage(named: "hobbyPhoto4") ?? UIImage())
        ],
        tagline: "Artist • Novels"
    ),
    EventaUser(
        usernumber: 2,
        name: "Anirudh M",
        age: 25,
        gender: "Male",
        profilePhoto: UIImage(named: "profile2") ?? UIImage(),
        interestTags: ["Dogs","Coding", "Gaming", "AI", "Machine Learning"],
        hobbies: [
            Hobby(description: "Building innovative software solutions.", photo: UIImage(named: "hobbyPhoto5") ?? UIImage()),
            Hobby(description: "Exploring the world of virtual reality.", photo: UIImage(named: "hobbyPhoto6") ?? UIImage())
        ],
        tagline: "Techie • Dogs"
    ),
    EventaUser(
        usernumber: 3,
        name: "Aman Kamat",
        age: 21,
        gender: "Male",
        profilePhoto: UIImage(named: "profile3") ?? UIImage(),
        interestTags: ["Nature","Music","Reading", "Writing", "Poetry", "Philosophy"],
        hobbies: [
            Hobby(description: "Lost in music and nature.", photo: UIImage(named: "hobbyPhoto7") ?? UIImage()),
            Hobby(description: "Crafting stories that inspire and evoke emotions.", photo: UIImage(named: "hobbyPhoto8") ?? UIImage())
        ],
        tagline: "Nature • Music"
    ),
    EventaUser(
        usernumber: 4,
        name: "Prajakta Koli",
        age: 31,
        gender: "Female",
        profilePhoto: UIImage(named: "profile4") ?? UIImage(),
        interestTags: ["Tennis","Food","Fitness", "Sports", "Hiking", "Camping"],
        hobbies: [
            Hobby(description: "Staying active and healthy.", photo: UIImage(named: "hobbyPhoto9") ?? UIImage()),
            Hobby(description: "Exploring nature's beauty.", photo: UIImage(named: "hobbyPhoto10") ?? UIImage())
        ],
        tagline: "Tennis • Foodie"
    ),
    EventaUser(
        usernumber: 5,
        name: "Madhusudhan",
        age: 23,
        gender: "Male",
        profilePhoto: UIImage(named: "profile5") ?? UIImage(),
        interestTags: ["Guitar","Art", "Painting", "Music", "Dance"],
        hobbies: [
            Hobby(description: "Expressing creativity through colors and strokes.", photo: UIImage(named: "hobbyPhoto11") ?? UIImage()),
            Hobby(description: "Moving to the rhythm of music.", photo: UIImage(named: "hobbyPhoto12") ?? UIImage())
        ],
        tagline: "Guitar • Campfire"
    ),
    EventaUser(
        usernumber: 6,
        name: "Samanth",
        age: 26,
        gender: "Male",
        profilePhoto: UIImage(named: "profile6") ?? UIImage(),
        interestTags: ["Nature","Technology", "Innovation", "Startups", "Entrepreneurship"],
        hobbies: [
            Hobby(description: "Building the future, one idea at a time.", photo: UIImage(named: "hobbyPhoto13") ?? UIImage()),
            Hobby(description: "Turning dreams into reality.", photo: UIImage(named: "hobbyPhoto14") ?? UIImage())
        ],
        tagline: "Nature • Fun"
    ),
    EventaUser(
        usernumber: 7,
        name: "Priya Sharma",
        age: 22,
        gender: "Female",
        profilePhoto: UIImage(named: "profile7") ?? UIImage(),
        interestTags: ["Music","Fashion", "Beauty", "Lifestyle", "Blogging"],
        hobbies: [
            Hobby(description: "Exploring the latest trends.", photo: UIImage(named: "hobbyPhoto15") ?? UIImage()),
            Hobby(description: "Sharing beauty tips and lifestyle hacks.", photo: UIImage(named: "hobbyPhoto16") ?? UIImage())
        ],
        tagline: "Creator • Singer"
    ),
    EventaUser(
        usernumber: 8,
        name: "Maria Andrea",
        age: 24,
        gender: "Female",
        profilePhoto: UIImage(named: "profile8") ?? UIImage(),
        interestTags: ["Travel","Dogs","Music", "Guitar", "Singing", "Songwriting"],
        hobbies: [
            Hobby(description: "Strumming melodies that soothe the soul.", photo: UIImage(named: "hobbyPhoto17") ?? UIImage()),
            Hobby(description: "Crafting songs that touch hearts.", photo: UIImage(named: "hobbyPhoto18") ?? UIImage())
        ],
        tagline: "Travel • Dogs"
    ),
    EventaUser(
        usernumber: 9,
        name: "Pranav Arun",
        age: 23,
        gender: "Male",
        profilePhoto: UIImage(named: "profile9") ?? UIImage(),
        interestTags: ["Movies","Psychology", "Counseling", "Mental Health", "Well-being"],
        hobbies: [
            Hobby(description: "Movie Buff", photo: UIImage(named: "hobbyPhoto19") ?? UIImage()),
            Hobby(description: "Promoting mental health awareness.", photo: UIImage(named: "hobbyPhoto20") ?? UIImage())
        ],
        tagline: "Cinema • Popcorn"
    ),
    EventaUser(
        usernumber: 10,
        name: "Niharika",
        age: 25,
        gender: "Female",
        profilePhoto: UIImage(named: "profile10") ?? UIImage(),
        interestTags: ["GYM","Art","History", "Archaeology", "Cultural Heritage", "Travel"],
        hobbies: [
            Hobby(description: "Unraveling the mysteries of the past.", photo: UIImage(named: "hobbyPhoto21") ?? UIImage()),
            Hobby(description: "Exploring ancient civilizations.", photo: UIImage(named: "hobbyPhoto22") ?? UIImage())
        ],
        tagline: "GYM • Art"
    ),
    EventaUser(
        usernumber: 11,
        name: "Neha Sharma",
        age: 21,
        gender: "Female",
        profilePhoto: UIImage(named: "profile11") ?? UIImage(),
        interestTags: ["Novels","Dance", "Choreography", "Fitness", "Yoga"],
        hobbies: [
            Hobby(description: "Grooving to the rhythm of life.", photo: UIImage(named: "hobbyPhoto23") ?? UIImage()),
            Hobby(description: "Balancing body and mind through yoga.", photo: UIImage(named: "hobbyPhoto24") ?? UIImage())
        ],
        tagline: "Stories • Books"
    ),
    EventaUser(
        usernumber: 12,
        name: "Ishaan Bhat",
        age: 22,
        gender: "Male",
        profilePhoto: UIImage(named: "profile12") ?? UIImage(),
        interestTags: ["Novels","Author","Music", "Dance", "Fitness", "Yoga"],
        hobbies: [
            Hobby(description: "Unleashing the power of music.", photo: UIImage(named: "hobbyPhoto25") ?? UIImage()),
            Hobby(description: "Balancing body and mind through yoga.", photo: UIImage(named: "hobbyPhoto26") ?? UIImage())
        ],
        tagline: "Coffee • Author")
    ]
