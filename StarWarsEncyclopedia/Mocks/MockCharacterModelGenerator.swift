////
////  MockCharacterModelGenerator.swift
////  StarWarsEncyclopedia
////
////  Created by Federico De Luca on 29/12/23.
////
//
//import Foundation
//
//class MockCharacterModelGenerator: StructGenerator {
//    var generatorCount: Int
//    
//    init() {
//        generatorCount = 0
//    }
//    
//    func generate() -> CharacterModel {
//        CharacterModel(name: "Luke Skywalker",
//                       height: "170",
//                       mass: "80",
//                       hairColor: "blond",
//                       skinColor: "fair",
//                       eyeColor: "blue",
//                       birthYear: "19BBY",
//                       gender: "male",
//                       homeworld: "Tatooine",
//                       species: ["human"])
//    }
//    
//    func generateTroopers() -> [CharacterModel] {
//        [
//            CharacterModel(name: "Trooper soldier #1",
//                           height: "160",
//                           mass: "70",
//                           hairColor: "blond",
//                           skinColor: "fair",
//                           eyeColor: "blue",
//                           birthYear: "19BBY",
//                           gender: "male",
//                           homeworld: "Imperial Department of Military Research",
//                           species: ["human"]),
//            CharacterModel(name: "Trooper soldier #2",
//                           height: "173",
//                           mass: "73",
//                           hairColor: "redhead",
//                           skinColor: "fair",
//                           eyeColor: "brown",
//                           birthYear: "19BBY",
//                           gender: "female",
//                           homeworld: "Imperial Department of Military Research",
//                           species: ["human"]),
//            CharacterModel(name: "That one trooper with the long name",
//                           height: "182",
//                           mass: "91",
//                           hairColor: "brunette",
//                           skinColor: "fair",
//                           eyeColor: "green",
//                           birthYear: "19BBY",
//                           gender: "male",
//                           homeworld: "Imperial Department of Military Research",
//                           species: ["human"])
//        ]
//    }
//}
