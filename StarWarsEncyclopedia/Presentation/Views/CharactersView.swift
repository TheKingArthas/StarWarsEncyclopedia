import SwiftUI

struct CharactersView: View {
    private var navigationTitle = "Characters"
    private var characters: [Character]
    
    init(characters: [Character] = []) {
        NavigationBarConfiguration.configureTitle()
        self.characters = characters
    }
    
    var body: some View {
        NavigationStack {
            mainView
                .navigationTitle(navigationTitle)
                .background {
                    SpaceBackgroundView()
                }
        }
    }
    
    @ViewBuilder
    private var mainView: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(characters, id: \.name) { character in
                    NavigationLink {
                        CharacterDetailedView(character: character)
                    } label: {
                        CharacterCellView(character: character)
                    }
                }
            }
            .padding(.horizontal, 24)
        }
    }
}

#Preview {
    CharactersView(characters: MockCharacterGenerator().generateTroopers())
}
