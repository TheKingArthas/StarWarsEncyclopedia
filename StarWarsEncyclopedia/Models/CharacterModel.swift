//
//  CharacterModel.swift
//  StarWarsEncyclopedia
//
//  Created by Federico De Luca on 29/12/23.
//

import Foundation

struct CharacterModel: Codable {
    var name: String
    var height: Int
    var mass: Int
    var hairColor: String
    var skinColor: String
    var eyesColor: String
    var birthYear: String
    var gender: String
    var homeworld: String
    var species: [String]
    var avatarImagePath: String
}
