//
//  MovieDataModel.swift
//  DeeperIntoTheJSONAbyss
//
//  Created by Adam Saxton on 3/18/19.
//  Copyright © 2019 Adam Saxton. All rights reserved.
//

import UIKit

class MovieDataModel: Codable {
    var franchise: [Franchises]
}

class Franchises: Codable {
    let franchiseName: String
    let entries: [Entry]
}

class Entry: Codable {
    let name: String
    let format: String
    let yearStart: String
    let yearEnd: String?
    let episode: Int?
    let studio: String?
    let description: String
    let summary: String
    //let casting: [Cast]
}

//class Cast: Codable {
//    let name: String
//    let starring: String
//}
