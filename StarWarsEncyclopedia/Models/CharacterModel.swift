//
//  CharacterModel.swift
//  StarWarsEncyclopedia
//
//  Created by Federico De Luca on 29/12/23.
//

import Foundation

struct CharactersModels: Codable {
    let results: [CharacterModel]
}

struct CharacterModel: Codable {
    let name: String
    let height: String
    let mass: String
    let hairColor: String
    let skinColor: String
    let eyeColor: String
    let birthYear: String
    let gender: String
    let homeworld: String
    let species: [String]
}
