import Foundation

struct Character {
    var name: String
    var height: Int
    var weight: Int
    var hairColor: String
    var skinColor: String
    var eyesColor: String
    var birthYear: String
    var gender: String
    var homeWorld: String
    var species: String
    var imagePaths: String
    
    init(model: CharacterModel) {
        self.name = model.name
        self.height = model.height
        self.weight = model.height
        self.hairColor = model.hairColor
        self.skinColor = model.skinColor
        self.eyesColor = model.eyesColor
        self.birthYear = model.birthYear
        self.gender = model.gender
        self.homeWorld = model.homeWorld
        self.species = model.species
        self.imagePaths = model.imagePaths
    }
}
