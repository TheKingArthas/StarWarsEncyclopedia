//
//  CharacterImageApi.swift
//  StarWarsEncyclopedia
//
//  Created by Federico De Luca on 1/3/24.
//

import Foundation

struct CharacterImageUrlService {
    func fetchCharacterImageUrl(name: String) async throws -> URL? {
        guard let endpointUrl = Endpoint.characterImage(characterName: name) else {
            throw ApiError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: endpointUrl)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ApiError.invalidResponse
        }
        
        if let dataString = String(data: data, encoding: .utf8) {
            print("Received data:", dataString)
        } else {
            print("Failed to convert data to string")
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let charactersImagesModels = try decoder.decode([CharacterImageModel].self, from: data)
            if let characterImageUrl = charactersImagesModels.first?.imageUrl {
                return URL(string: characterImageUrl)
            } else {
                throw ApiError.invalidData
            }
        } catch {
            throw ApiError.invalidData
        }
    }
}
