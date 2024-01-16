//
//  CharactersViewModel.swift
//  StarWarsEncyclopedia
//
//  Created by Federico De Luca on 16/1/24.
//

import Foundation

struct CharactersViewModel {
    private(set) var characters: [Character] = []
    
    mutating func getCharacters() async throws {
        do {
            let charactersModels = try await CharacterApi().getCharacters()
            charactersModels.forEach { model in
                characters.append(Character(model: model))
            }
        } catch {
            throw error
        }
    }
}
