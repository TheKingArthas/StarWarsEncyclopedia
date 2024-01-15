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
    var height: Int
    var weight: Int
    var hairColor: String
    var skinColor: String
    var eyesColor: String
    var birthYear: String
    var gender: Gender
    var avatarImagePath: String
    
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
        self.height = model.height
        self.weight = model.mass
        self.hairColor = model.hairColor
        self.skinColor = model.skinColor
        self.eyesColor = model.eyesColor
        self.birthYear = model.birthYear
        self.gender = Self.genderFromString(model.gender)
        self.avatarImagePath = model.avatarImagePath
    }
}
