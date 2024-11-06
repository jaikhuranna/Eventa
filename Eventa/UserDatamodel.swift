//
//  UserDatamodel.swift
//  Eventa
//
//  Created by Vinod P on 06/11/24.
//

import Foundation
import UIKit

struct EventaUser {
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

/* Sample Data
let sampleUser = EventaUser(
    name: "User1",
    age: 22,
    gender: "Female",
    profilePhoto: UIImage(named: "defaultProfile") ?? UIImage(),
    interestTags: ["Music", "Games", "3D ART"],
    hobbies: [
        Hobby(description: "Playing guitar", photo: UIImage(named: "guitarPhoto") ?? UIImage()),
        Hobby(description: "Painting landscapes", photo: UIImage(named: "paintingPhoto") ?? UIImage())
    ],
    tagline: "I love painting🎨 and playing 🎸."
)*/

let User0 = EventaUser(
    name: "Jai Khurana",
    age: 20,
    gender: "Male",
    profilePhoto: UIImage(named: "ProfilePhoto") ?? UIImage(),
    interestTags: ["Rock music", "Video Games", "3D art", "Blender", "Vinyl records", "Art"],
    hobbies: [
        Hobby(description: "I love old classic music, from punk, rock to jazz...", photo: UIImage(named: "hobbyPhoto1git") ?? UIImage()),
        Hobby(description: "Exploring digital art and patterns.", photo: UIImage(named: "hobbyPhoto2") ?? UIImage())
    ],
    tagline: "Retro Music Lover & 3D Artist"
)
