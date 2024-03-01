//
//  CharacterImageModel.swift
//  StarWarsEncyclopedia
//
//  Created by Federico De Luca on 1/3/24.
//

import Foundation

struct CharacterImageModels: Codable {
    let results: [CharacterImageModel]
}

struct CharacterImageModel: Codable {
    let id: String
    let name: String
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageUrl = "image"
    }
}
