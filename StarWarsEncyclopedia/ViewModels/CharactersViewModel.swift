//
//  CharactersViewModel.swift
//  StarWarsEncyclopedia
//
//  Created by Federico De Luca on 16/1/24.
//

import Foundation

struct CharactersViewModel {
    var characters: [Character] = []
    var currentPage: Int = 1
    
    mutating func getCharactersFromCurrentPage() async throws {
        try await getCharactersFromPage(pageNumber: currentPage)
    }
    
    mutating func getCharactersFromPreviousPage() async throws {
        currentPage += 1
        try await getCharactersFromPage(pageNumber: currentPage)
    }
    
    mutating func getCharactersFromNextPage() async throws {
        if currentPage > 1 {
            currentPage -= 1
            try await getCharactersFromPage(pageNumber: currentPage)
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
    
    private mutating func getCharactersFromPage(pageNumber: Int) async throws {
        do {
            let charactersModels = try await CharacterService().getCharactersFromPage(pageNumber)
            charactersModels.forEach { model in
                characters.append(Character(model: model))
            }
        } catch {
            throw error
        }
    }
}
