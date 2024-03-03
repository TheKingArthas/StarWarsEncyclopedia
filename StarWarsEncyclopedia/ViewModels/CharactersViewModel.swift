//
//  CharactersViewModel.swift
//  StarWarsEncyclopedia
//
//  Created by Federico De Luca on 16/1/24.
//

import Foundation
import SwiftUI

class CharactersViewModel: ObservableObject {
    @Published var charactersFetchingFinished: Bool = false
    @Published var currentPage: Int = 1
    var allCharacters: [Character] { paginatedCharacters.flatMap{ $0 } }
    var charactersFromCurrentPage: [Character] { getCharactersFromPage(currentPage) }
    @Published private var paginatedCharacters: [[Character]] = [[]]
    
    func fetchCharacters() async throws {
        charactersFetchingFinished = false
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
        charactersFetchingFinished = true
    }
    
    
    func fetchCharacterImageUrl(_ character: Character) async -> URL? {
        do {
            return try await CharacterImageUrlService().fetchCharacterImageUrl(name: character.name)
        } catch {
            print(error)
            return nil
        }
    }
    
    func isFirstPage() -> Bool {
        currentPage == 1
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
    
    private func fetchCharactersFromPage(_ pageNumber: Int) async throws -> [Character] {
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
