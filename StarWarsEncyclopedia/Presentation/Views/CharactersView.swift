//
//  CharactersView.swift
//  StarWarsEncyclopedia
//
//  Created by Federico De Luca on 31/12/23.
//

import SwiftUI

struct CharactersView: View {
    private static var navigationTitle = "Characters"
    private var characters: [Character]
    
    init(characters: [Character]) {
        NavigationBarConfiguration.configureTitle()
        self.characters = characters
    }
    
    var body: some View {
        NavigationStack {
            mainView
                .navigationTitle(Self.navigationTitle)
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
                        CustomCellView(title: character.name)
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
