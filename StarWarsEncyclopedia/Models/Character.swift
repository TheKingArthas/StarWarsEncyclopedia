//
//  Character.swift
//  StarWarsEncyclopedia
//
//  Created by Federico De Luca on 29/12/23.
//

import Foundation

enum Gender {
    case other,
         male,
         female
}

struct Character {
    var name: String
    var height: Int = 0
    var weight: Int = 0
    var hairColor: String = ""
    var skinColor: String = ""
    var eyesColor: String = ""
    var birthYear: String = ""
    var gender: Gender = .other
    
    private static func genderFromString(_ genderAsString: String) -> Gender {
        if genderAsString == "male" {
            return .male
        } else if genderAsString == "female" {
            return .female
        } else {
            return .other
        }
    }
    
    init(model: CharacterModel) {
        self.name = model.name
//        self.height = Int(model.height) ?? 0
//        self.weight = Int(model.mass) ?? 0
//        self.hairColor = model.hairColor
//        self.skinColor = model.skinColor
//        self.eyesColor = model.eyeColor
//        self.birthYear = model.birthYear
//        self.gender = Self.genderFromString(model.gender)
    }
}
