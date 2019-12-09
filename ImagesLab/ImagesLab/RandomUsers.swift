//
//  RandomUsers.swift
//  ImagesLab
//
//  Created by Oscar Victoria Gonzalez  on 12/9/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import Foundation

struct RandomUsers: Decodable {
    let results: [Users]
}

struct Users: Decodable {
    let gender: String
    let name: Name
    let location: Location
    let phone: String
    let cell: String
    let picture: Picture
    let dob: DOB
}

struct Name: Decodable {
    let first: String
    let last: String
    var fullName: String {
        "\(first) \(last)"
    }
    
}

struct Location: Decodable {
    let city: String
    let country: String
    let state: String
}

struct Picture: Decodable {
    let thumbnail: String 
    let medium: String
    let large: String
}

struct DOB: Decodable {
    let age: Int
    let date: String
}
