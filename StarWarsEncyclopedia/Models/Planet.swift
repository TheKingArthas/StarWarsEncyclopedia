//
//  Plaanet.swift
//  StarWarsEncyclopedia
//
//  Created by Federico De Luca on 1/1/24.
//

import Foundation

struct Planet {
    var name: String
    var population: Int
    var gravity: Double
    var terrain: String
    var diameter: Double
    var orbitalPeriod: Int
    var rotationPeriod: Int
    var surfaceWater: Bool
    
    init(model: PlanetModel) {
        self.name = model.name
        self.population = model.population
        self.gravity = model.gravity
        self.terrain = model.terrain
        self.diameter = model.diameter
        self.orbitalPeriod = model.orbitalPeriod
        self.rotationPeriod = model.rotationPeriod
        self.surfaceWater = model.surfaceWater == 1
    }
}
