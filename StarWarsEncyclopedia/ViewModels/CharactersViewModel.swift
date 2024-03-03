//
//  CharactersViewModel.swift
//  StarWarsEncyclopedia
//
//  Created by Federico De Luca on 16/1/24.
//

import Foundation

struct CharactersViewModel {
    var currentPage: Int = 1
    var allCharacters: [Character] { paginatedCharacters.flatMap{ $0 } }
    var charactersFromCurrentPage: [Character] { getCharactersFromPage(currentPage) }
    private var paginatedCharacters: [[Character]] = [[]]
    
    mutating func fetchCharacters() async throws {
        var fetchedCurrentPage = 1
        var lastPageWasReached: Bool = false
        while !lastPageWasReached {
            do {
                let pageCharacters = try await fetchCharactersFromPage(fetchedCurrentPage)
                if pageCharacters.isEmpty {
                    lastPageWasReached = true
                } else {
                    paginatedCharacters.append(pageCharacters)
                    fetchedCurrentPage += 1
                }
            } catch {
                throw error
            }
        }
    }
    
    
    func fetchCharacterImageUrl(_ character: Character) async -> URL? {
        do {
            return try await CharacterImageUrlService().fetchCharacterImageUrl(name: character.name)
        } catch {
            print(error)
            return nil
        }
    }
    
    func isLastPage() -> Bool {
        currentPage + 1 == paginatedCharacters.count
    }
    
    private func getCharactersFromPage(_ pageNumber: Int) -> [Character] {
        if 1 <= pageNumber && pageNumber < paginatedCharacters.count {
            paginatedCharacters[pageNumber]
        } else {
            []
        }
    }
    
    private mutating func fetchCharactersFromPage(_ pageNumber: Int) async throws -> [Character] {
        do {
            var characters: [Character] = []
            let charactersModels = try await CharacterService().fetchCharactersFromPage(pageNumber)
            charactersModels.forEach { model in
                characters.append(Character(model: model))
            }
            return characters
        } catch ApiError.notFound {
            return []
        } catch {
            throw error
        }
    }
}
