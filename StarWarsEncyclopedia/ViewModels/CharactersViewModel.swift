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
            let charactersModels = try await CharacterService().getCharacters()
            charactersModels.forEach { model in
                characters.append(Character(model: model))
            }
        } catch {
            throw error
        }
    }
    
    func getCharacterImageUrl(_ character: Character) async -> URL? {
        do {
            return try await CharacterImageUrlService().getCharacterImageUrl(name: character.name)
        } catch {
            print(error)
            return nil
        }
    }
}
