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
    var homeWorld: String
    var species: String
    var imagePaths: String
    
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
        self.weight = model.weight
        self.hairColor = model.hairColor
        self.skinColor = model.skinColor
        self.eyesColor = model.eyesColor
        self.birthYear = model.birthYear
        self.gender = Self.genderFromString(model.gender)
        self.homeWorld = model.homeWorld
        self.species = model.species
        self.imagePaths = model.imagePaths
    }
}
