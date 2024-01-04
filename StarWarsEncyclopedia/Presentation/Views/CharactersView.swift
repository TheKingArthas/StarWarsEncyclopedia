//
//  CharactersView.swift
//  StarWarsEncyclopedia
//
//  Created by Federico De Luca on 31/12/23.
//

import SwiftUI

struct CharactersView: View {
    private static var navigationTitle = "Characters"
    @State private var searchTerm: String
    private var characters: [Character]
    private var filteredCharacters: [Character] {
        guard !searchTerm.isEmpty else { return characters }
        return characters.filter { $0.name.localizedStandardContains(searchTerm) }
    }
    
    init(characters: [Character]) {
        NavigationBarConfiguration.configureTitle()
        self.searchTerm = ""
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
        List(filteredCharacters, id: \.name) { character in
            NavigationLink {
                CharacterDetailedView(character: character)
            } label: {
                CustomCellView(title: character.name)
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
            .listRowInsets(EdgeInsets())
        }
        .scrollContentBackground(.hidden)
        .listRowSpacing(8)
        .searchable(text: $searchTerm, prompt: "Search Character")
        .font(CustomTypography.body)
        .foregroundColor(.white)
    }
}

#Preview {
    CharactersView(characters: MockCharacterGenerator().generateTroopers())
}
