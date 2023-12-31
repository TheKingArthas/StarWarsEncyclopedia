import SwiftUI

struct CharacterDetailedView: View {
    @State private var bouncing = false
    private var character: Character
    
    init(character: Character) {
        self.character = character
    }
    
    var body: some View {
        mainView
    }
    
    private var mainView: some View {
        VStack {
            characterAvatarView()
                .padding([.top, .bottom], 32)
            characterNameView()
                .padding(.bottom, 8)
            characterInfoView()
                .padding(.bottom, 32)
        }
        .padding(.horizontal, 32)
        .background {
            backgroundView()
        }
    }
    
    private func backgroundView() -> some View {
        ZStack {
            CustomImaging.spaceBackground
                .opacity(0.9)
            LinearGradient(gradient: Gradient(colors: [Color.clear,
                                                       Color.black,
                                                       CustomColor.darkerGray]),
                           startPoint: .top,
                           endPoint: .bottom)
        }
    }
    
    private func characterNameView() -> some View {
        Text("\(character.name)")
            .h1Style()
    }
    
    private func characterInfoView() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            if character.gender != .other {
                HStack {
                    Text("Gender: ")
                        .bodyStyle()
                    genderImageView(character.gender)
                }
            }
            Text("Birth year: \(character.birthYear)")
                .bodyStyle()
            Text("Height: \(character.height)")
                .bodyStyle()
            Text("Weight: \(character.weight)")
                .bodyStyle()
            Text("Hair color: \(character.hairColor)")
                .bodyStyle()
            Text("Skin color: \(character.skinColor)")
                .bodyStyle()
            Text("Eyes color: \(character.eyesColor)")
                .bodyStyle()
        }
    }
    
    private func characterAvatarView() -> some View {
        Image(systemName: "person.fill")
            .resizable()
            .background(Color.white)
            .aspectRatio(contentMode: .fill)
            .frame(width: 256, height: 256)
            .clipShape(Circle())
            .frame(maxHeight: 280, alignment: bouncing ? .bottom : .top)
            .animation(Animation.easeInOut(duration: 5.0).repeatForever(autoreverses: true),
                       value: bouncing)
            .onAppear {
                self.bouncing.toggle()
            }
    }
    
    @ViewBuilder
    private func genderImageView(_ gender: Gender) -> some View {
        let frameSize: CGFloat = 24
        
        switch gender {
        case .male:
            CustomImaging.genderMale
                .resizable()
                .renderingMode(.template)
                .foregroundStyle(.white)
                .frame(width: frameSize, height: frameSize)
        case .female:
            CustomImaging.genderFemale
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
    return CharacterDetailedView(character: character)
}
