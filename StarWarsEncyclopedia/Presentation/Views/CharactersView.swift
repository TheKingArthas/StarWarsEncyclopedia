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
    @State private var characters: [Character]
    @State private var error: Error?
    @State private var shouldShowAlert: Bool = false
    
    private var filteredCharacters: [Character] {
        guard !searchTerm.isEmpty else { return characters }
        return characters.filter { $0.name.localizedStandardContains(searchTerm) }
    }
    
    init(characters: [Character]) {
        NavigationBarConfiguration.configureTitle()
        self.searchTerm = ""
        self.characters = []
    }
    
    var body: some View {
        NavigationStack {
            mainView
                .navigationTitle(Self.navigationTitle)
                .background {
                    SpaceBackgroundView()
                }
        }
        .task {
            do {
                let charactersModels = try await CharacterApi().getCharacters()
                characters = charactersModels.compactMap { model in
                    Character(model: model)
                }
            } catch {
                self.error = error
                shouldShowAlert = true
            }
        }
        .alert(isPresented: $shouldShowAlert,
               content: {
            if let error = error {
                CustomSystemAlert().alertFromError(error, shouldShowAlert: $shouldShowAlert)
            } else {
                Alert(title: Text(""))
            }
        })
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

//#Preview {
//    CharactersView(characters: MockCharacterGenerator().generateTroopers())
//}
