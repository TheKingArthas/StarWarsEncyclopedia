//
//  Endpoints.swift
//  StarWarsEncyclopedia
//
//  Created by Federico De Luca on 15/1/24.
//

import Foundation

struct Endpoint {
    static var characters: URL? {
        URL(string: "https://swapi.dev/api/people")
    }
    
    private static var serverUrl: String {
        "https://swapi.dev/api"
    }
    
    private init() {}
    
    static private func endpointUrl(_ endpointName: EndpointName) -> URL? {
        URL(string: "\(serverUrl)/\(endpointName)")
    }
}

enum ApiError: Error {
    case invalidData
    case invalidResponse
    case invalidUrl
}

fileprivate enum EndpointName: String {
    case people = "people"
}
