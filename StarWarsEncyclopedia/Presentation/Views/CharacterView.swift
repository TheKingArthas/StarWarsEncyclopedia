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
                    .padding([.top, .bottom], 32)
                characterInfoView()
                    .padding(.bottom, 32)
            }
        }
    }
    
    private func backgroundView() -> some View {
        ZStack {
            Image("SpaceBackground")
                .opacity(0.9)
            LinearGradient(gradient: Gradient(colors: [Color.clear,
                                                       Color.black,
                                                       Color.gray]),
                           startPoint: .top,
                           endPoint: .bottom)
        }
    }
    
    private func characterInfoView() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("\(character.name)")
                .font(.system(size: 32))
                .foregroundStyle(.white)
            if character.gender != .other {
                HStack {
                    Text("Gender: ")
                        .foregroundStyle(.white)
                    genderImageView(character.gender)
                }
            }
            Text("Birth year: \(character.birthYear)")
                .foregroundStyle(.white)
            Text("Height: \(character.height)")
                .foregroundStyle(.white)
            Text("Weight: \(character.weight)")
                .foregroundStyle(.white)
            Text("Hair color: \(character.hairColor)")
                .foregroundStyle(.white)
            Text("Skin color: \(character.skinColor)")
                .foregroundStyle(.white)
            Text("Eyes color: \(character.eyesColor)")
                .foregroundStyle(.white)
        }
    }
    
    private func characterAvatarView() -> some View {
        Image(systemName: "person.fill")
            .resizable()
            .background(Color.white)
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
                .renderingMode(.template)
                .foregroundStyle(.white)
                .frame(width: frameSize, height: frameSize)
        case .female:
            Image("gender_female")
                .resizable()
                .renderingMode(.template)
                .foregroundStyle(.white)
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
