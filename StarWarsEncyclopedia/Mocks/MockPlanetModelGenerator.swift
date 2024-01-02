//
//  MockPlanetGenerator.swift
//  StarWarsEncyclopedia
//
//  Created by Federico De Luca on 1/1/24.
//

import Foundation

class MockPlanetModelGenerator: StructGenerator {
    var generatorCount: Int
    
    init() {
        self.generatorCount = 0
    }
    
    func generate() -> PlanetModel {
        PlanetModel(name: "Arid",
                    population: 120000,
                    gravity: 1,
                    terrain: "Dessert",
                    diameter: 10465,
                    orbitalPeriod: 304,
                    rotationPeriod: 23,
                    surfaceWater: 1)
    }
    
    func generateGalaxy() -> [PlanetModel] {
        [
            PlanetModel(name: "Planet 1",
                        population: 100000,
                        gravity: 1,
                        terrain: "Dessert",
                        diameter: 12345,
                        orbitalPeriod: 300,
                        rotationPeriod: 30,
                        surfaceWater: 1),
            PlanetModel(name: "Planet 2",
                        population: 250000,
                        gravity: 10,
                        terrain: "Dessert",
                        diameter: 23456,
                        orbitalPeriod: 350,
                        rotationPeriod: 40,
                        surfaceWater: 0),
            PlanetModel(name: "That planet with the really long name",
                        population: 500000,
                        gravity: 9.5,
                        terrain: "Dessert",
                        diameter: 2345,
                        orbitalPeriod: 200,
                        rotationPeriod: 20,
                        surfaceWater: 1),
        ]
    }
}
