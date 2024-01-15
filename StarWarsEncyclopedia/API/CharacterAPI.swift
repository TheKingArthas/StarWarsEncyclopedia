//
//  CharacterAPI.swift
//  StarWarsEncyclopedia
//
//  Created by Federico De Luca on 15/1/24.
//

import Foundation

struct CharacterAPI {
    func getCharacter() async throws -> CharacterModel {
        guard let endpointUrl = Endpoint.characters else {
            throw ApiError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: endpointUrl)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ApiError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(CharacterModel.self, from: data)
        } catch {
            throw ApiError.invalidData
        }
    }
}
