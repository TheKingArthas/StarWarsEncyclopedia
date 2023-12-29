import SwiftUI

struct CharacterView: View {
    private var character: Character
    
    init(character: Character) {
        self.character = character
    }
    
    var body: some View {
        mainView
    }
    
    private var mainView: some View {
        VStack(alignment: .leading) {
            Image(systemName: "person.fill")
            Text("Name: \(character.name)")
            Text("Gender: \(character.gender)")
            Text("Birth year: \(character.birthYear)")
            Text("Height: \(character.height)")
            Text("Weight: \(character.weight)")
            Text("Hair color: \(character.hairColor)")
            Text("Skin color: \(character.skinColor)")
            Text("Eyes color: \(character.eyesColor)")
        }
    }
}

#Preview {
    let model = MockCharacterModelGenerator().generate()
    let character = Character(model: model)
    return CharacterView(character: character)
}
