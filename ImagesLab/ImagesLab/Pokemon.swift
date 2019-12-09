//
//  Pokemon.swift
//  ImagesLab
//
//  Created by Oscar Victoria Gonzalez  on 12/8/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import Foundation

struct Pokemon: Decodable {
    let cards: [Cards]
}

struct Cards: Decodable {
    let id: String
    let name: String
    let imageUrl: String
    let imageUrlHiRes: String
    let set: String
}

struct Weakness: Decodable {
    let type: String
    let value: String
}


