import SwiftUI

struct CharacterCellView: View {
    @State private var avatarRotationDegrees: Double
    private var character: Character
    
    init(character: Character) {
        avatarRotationDegrees = 0.0
        self.character = character
    }
    
    var body: some View {
        mainView
            .onAppear {
                startAvatarRotation()
            }
    }
    
    private var mainView: some View {
        ZStack {
            CustomColor.darkerGray
            HStack {
                characterAvatarView()
                    .padding(.vertical, 8)
                Spacer()
                characterNameView()
                Spacer()
                moreButtonView()
            }
            .padding(.horizontal, 16)
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
    private func characterAvatarView() -> some View {
        Image(.jarJarBinks)
            .resizable()
            .scaledToFit()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
            .rotation3DEffect(.degrees(avatarRotationDegrees), axis: (x: 0, y: 1, z: 0))
    }
    
    private func characterNameView() -> some View {
        Text(character.name)
            .bodyStyle()
            .lineLimit(1)
    }
    
    private func moreButtonView() -> some View {
        Button {
            
        } label: {
            CustomImaging.moreButton
                .foregroundStyle(.white)
        }
    }
    
    func startAvatarRotation() {
        withAnimation(Animation.linear(duration: 10).repeatForever(autoreverses: false)) {
            avatarRotationDegrees = 360
        }
    }
}

#Preview {
    CharacterCellView(character: MockCharacterGenerator().generate())
}
