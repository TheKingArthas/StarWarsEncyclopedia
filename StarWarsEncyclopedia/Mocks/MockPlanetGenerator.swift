//
//  MockPlanetGenerator.swift
//  StarWarsEncyclopedia
//
//  Created by Federico De Luca on 1/1/24.
//

import Foundation

struct MockPlanetGenerator: StructGenerator {
    var generatorCount: Int
    
    init() {
        self.generatorCount = 0
    }
    
    func generate() -> Planet {
        Planet(model: MockPlanetModelGenerator().generate())
    }
    
    func generateGalaxy() -> [Planet] {
        MockPlanetModelGenerator().generateGalaxy().compactMap { planetModel in
            Planet(model: planetModel)
        }
    }
}
