import SwiftUI

struct CharacterCellView: View {
    private var character: Character
    
    init(character: Character) {
        self.character = character
    }
    
    var body: some View {
        mainView
    }
    
    private var mainView: some View {
        ZStack {
            CustomColor.darkerGray
            HStack {
                characterAvatarView()
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
}

#Preview {
    CharacterCellView(character: MockCharacterGenerator().generate())
}
