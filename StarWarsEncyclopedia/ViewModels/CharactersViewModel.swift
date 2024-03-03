//
//  CharactersViewModel.swift
//  StarWarsEncyclopedia
//
//  Created by Federico De Luca on 16/1/24.
//

import Foundation

struct CharactersViewModel {
    var currentPage: Int = 1
    private var characters: [[Character]] = []
    
    mutating func fetchCharacters() async throws {
        var startingPage = 1
        
        for currentPage in startingPage... {
            do {
                let pageCharacters = try await fetchCharactersFromPage(currentPage)
                if pageCharacters.isEmpty {
                    break
                } else {
                    characters[currentPage] = pageCharacters
                }
            } catch {
                throw error
            }
        }
    }
    
    func getCharactersFromPage(_ pageNumber: Int) -> [Character] {
        characters[pageNumber]
    }
    
    func fetchCharacterImageUrl(_ character: Character) async -> URL? {
        do {
            return try await CharacterImageUrlService().fetchCharacterImageUrl(name: character.name)
        } catch {
            print(error)
            return nil
        }
    }
    
    private mutating func fetchCharactersFromPage(_ pageNumber: Int) async throws -> [Character] {
        var characters: [Character] = []
        do {
            let charactersModels = try await CharacterService().fetchCharactersFromPage(pageNumber)
            charactersModels.forEach { model in
                characters.append(Character(model: model))
            }
            return characters
        } catch {
            throw error
        }
    }
}
