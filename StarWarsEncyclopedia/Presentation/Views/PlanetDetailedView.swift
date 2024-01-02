//
//  PlanetDetailedView.swift
//  StarWarsEncyclopedia
//
//  Created by Federico De Luca on 1/1/24.
//

import SwiftUI

struct PlanetDetailedView: View {
    private var planet: Planet
    
    init(planet: Planet) {
        self.planet = planet
    }
    
    var body: some View {
        mainView
            .background {
                SpaceBackgroundView()
            }
    }
    
    @ViewBuilder
    private var mainView: some View {
        planetNameView()
            .padding(.top, 32)
        Spacer()
        planetInfoView()
            .padding(.bottom, 32)
    }
    
    private func planetNameView() -> some View {
        Text(planet.name)
            .h1Style()
    }
    
    @ViewBuilder
    private func planetInfoView() -> some View {
        VStack(alignment: .leading) {
            Text("Population: \(planet.population)")
                .bodyStyle()
            Text("Gravity: \(planet.gravity)")
                .bodyStyle()
            Text("Terrain: \(planet.terrain)")
                .bodyStyle()
            Text("Diameter: \(planet.diameter)")
                .bodyStyle()
            Text("orbital period: \(planet.orbitalPeriod)")
                .bodyStyle()
            Text("Rotation period: \(planet.rotationPeriod)")
                .bodyStyle()
            Text("Surface water: \(planet.surfaceWater ? "Yes" : "No")")
                .bodyStyle()
        }
    }
}

#Preview {
    PlanetDetailedView(planet: MockPlanetGenerator().generate())
}
