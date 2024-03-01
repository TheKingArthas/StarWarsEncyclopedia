//
//  CharacterImageApi.swift
//  StarWarsEncyclopedia
//
//  Created by Federico De Luca on 1/3/24.
//

import Foundation

struct CharacterImageUrlService {
    func getCharacterImageUrl(name: String) async throws -> URL? {
        guard let endpointUrl = Endpoint.characterImage(characterName: name) else {
            throw ApiError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: endpointUrl)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ApiError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let characterImageModels = try decoder.decode(CharacterImageModels.self, from: data).results
            if let imageUrlString = characterImageModels.first?.imageUrl {
                return URL(string: imageUrlString)
            } else {
                throw ApiError.invalidData
            }
        } catch {
            throw ApiError.invalidData
        }
    }
}
