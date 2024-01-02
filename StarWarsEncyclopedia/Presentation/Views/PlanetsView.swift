//
//  PlanetsView.swift
//  StarWarsEncyclopedia
//
//  Created by Federico De Luca on 2/1/24.
//

import SwiftUI

struct PlanetsView: View {
    private static var navigationTitle = "Planets"
    private var planets: [Planet]
    
    init(planets: [Planet]) {
        NavigationBarConfiguration.configureTitle()
        self.planets = planets
    }
    
    var body: some View {
        NavigationStack {
            mainView
                .navigationTitle(Self.navigationTitle)
                .background {
                    SpaceBackgroundView()
                }
        }
    }
    
    @ViewBuilder
    private var mainView: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(planets, id: \.name) { planet in
                    NavigationLink {
                        PlanetDetailedView(planet: planet)
                    } label: {
                        CustomCellView(title: planet.name)
                    }
                }
            }
            .padding(.horizontal, 24)
        }
    }
}

#Preview {
    PlanetsView(planets: MockPlanetGenerator().generateGalaxy())
}
