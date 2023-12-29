import Foundation

class MockCharacterModelGenerator: StructGenerator {
    var generatorCount: Int
    
    init() {
        generatorCount = 0
    }
    
    func generate() -> CharacterModel {
        CharacterModel(name: "Luke Skywalker",
                       height: 170,
                       weight: 80,
                       hairColor: "blond",
                       skinColor: "fair",
                       eyesColor: "blue",
                       birthYear: "19BBY",
                       gender: "male",
                       homeWorld: "Tatooine",
                       species: "human",
                       imagePaths: "https://www.fakePath.com/luke_skywalker")
    }
}
