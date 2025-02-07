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
    let name: String
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageUrl = "image"
    }
}
