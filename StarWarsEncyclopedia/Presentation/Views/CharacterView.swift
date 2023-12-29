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
        ZStack {
            backgroundView()
                .ignoresSafeArea()
            VStack {
                characterAvatarView()
                characterInfoView()
            }
        }
    }
    
    private func backgroundView() -> some View {
        LinearGradient(gradient: Gradient(colors: [Color.black,
                                                   Color.teal,
                                                   Color.white]),
                       startPoint: .top,
                       endPoint: .bottom)
    }
    
    private func characterInfoView() -> some View {
        VStack(alignment: .leading) {
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
    
    private func characterAvatarView() -> some View {
        Image(systemName: "person.fill")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 250, height: 250)
            .clipShape(Circle())
    }
}

#Preview {
    let model = MockCharacterModelGenerator().generate()
    let character = Character(model: model)
    return CharacterView(character: character)
}
