import SwiftUI

struct CharactersView: View {
    private var navigationTitle = "Characters"
    private var characters: [Character]
    
    init(characters: [Character] = []) {
        self.characters = characters
    }
    
    var body: some View {
        NavigationStack {
            mainView
                .navigationTitle(navigationTitle)
        }
    }
    
    private var mainView: some View {
        List(characters, id: \.name) { character in
            CharacterCellView(character: character)
        }
        .listStyle(.plain)
    }
}

#Preview {
    CharactersView(characters: MockCharacterGenerator().generateTroopers())
}
