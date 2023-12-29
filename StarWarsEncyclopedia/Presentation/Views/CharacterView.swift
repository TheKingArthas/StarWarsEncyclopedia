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
        VStack(alignment: .leading, spacing: 8) {
            Text("Name: \(character.name)")
            HStack {
                Text("Gender: ")
                genderImageView(character.gender)
            }
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
            .frame(width: 256, height: 256)
            .clipShape(Circle())
    }
    
    @ViewBuilder
    private func genderImageView(_ gender: Gender) -> some View {
        let frameSize: CGFloat = 24
        
        switch gender {
        case .male:
            Image("gender_male")
                .resizable()
                .frame(width: frameSize, height: frameSize)
        case .female:
            Image("gender_female")
                .resizable()
                .frame(width: frameSize, height: frameSize)
        default:
            EmptyView()
        }
    }
}

#Preview {
    let model = MockCharacterModelGenerator().generate()
    let character = Character(model: model)
    return CharacterView(character: character)
}
