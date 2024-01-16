//
//  CharacterModel.swift
//  StarWarsEncyclopedia
//
//  Created by Federico De Luca on 29/12/23.
//

import Foundation

struct CharactersModels: Codable {
    var results: [CharacterModel]
}

struct CharacterModel: Codable {
    var name: String
//    var height: String
//    var mass: String
//    var hairColor: String
//    var skinColor: String
//    var eyeColor: String
//    var birthYear: String
//    var gender: String
//    var homeworld: String
//    var species: [String]
}
