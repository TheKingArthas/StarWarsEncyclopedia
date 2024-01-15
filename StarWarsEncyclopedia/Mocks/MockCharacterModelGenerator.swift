//
//  MockCharacterModelGenerator.swift
//  StarWarsEncyclopedia
//
//  Created by Federico De Luca on 29/12/23.
//

import Foundation

class MockCharacterModelGenerator: StructGenerator {
    var generatorCount: Int
    
    init() {
        generatorCount = 0
    }
    
    func generate() -> CharacterModel {
        CharacterModel(name: "Luke Skywalker",
                       height: 170,
                       mass: 80,
                       hairColor: "blond",
                       skinColor: "fair",
                       eyesColor: "blue",
                       birthYear: "19BBY",
                       gender: "male",
                       homeworld: "Tatooine",
                       species: ["human"],
                       avatarImagePath: "https://www.fakePath.com/luke_skywalker")
    }
    
    func generateTroopers() -> [CharacterModel] {
        [
            CharacterModel(name: "Trooper soldier #1",
                           height: 160,
                           mass: 70,
                           hairColor: "blond",
                           skinColor: "fair",
                           eyesColor: "blue",
                           birthYear: "19BBY",
                           gender: "male",
                           homeworld: "Imperial Department of Military Research",
                           species: ["human"],
                           avatarImagePath: "https://www.fakePath.com/luke_skywalker"),
            CharacterModel(name: "Trooper soldier #2",
                           height: 173,
                           mass: 73,
                           hairColor: "redhead",
                           skinColor: "fair",
                           eyesColor: "brown",
                           birthYear: "19BBY",
                           gender: "female",
                           homeworld: "Imperial Department of Military Research",
                           species: ["human"],
                           avatarImagePath: "https://www.fakePath.com/luke_skywalker"),
            CharacterModel(name: "That one trooper with the long name",
                           height: 182,
                           mass: 91,
                           hairColor: "brunette",
                           skinColor: "fair",
                           eyesColor: "green",
                           birthYear: "19BBY",
                           gender: "male",
                           homeworld: "Imperial Department of Military Research",
                           species: ["human"],
                           avatarImagePath: "https://www.fakePath.com/luke_skywalker")
        ]
    }
}
