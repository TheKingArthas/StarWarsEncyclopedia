//
//  PlanetsView.swift
//  StarWarsEncyclopedia
//
//  Created by Federico De Luca on 2/1/24.
//

import SwiftUI

struct PlanetsView: View {
    private static var navigationTitle = "Planets"
    @State private var searchTerm: String
    private var planets: [Planet]
    private var filteredPlanets: [Planet] {
        guard !searchTerm.isEmpty else { return planets }
        return planets.filter { $0.name.localizedStandardContains(searchTerm) }
    }
    
    init(planets: [Planet]) {
        NavigationBarConfiguration.configureTitle()
        self.searchTerm = ""
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
        List(filteredPlanets, id: \.name) { planet in
            NavigationLink {
                PlanetDetailedView(planet: planet)
            } label: {
                CustomCellView(title: planet.name)
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
            .listRowInsets(EdgeInsets())
        }
        .scrollContentBackground(.hidden)
        .listRowSpacing(8)
        .searchable(text: $searchTerm, prompt: "Search Planet")
        .font(CustomTypography.body)
        .foregroundColor(.white)
    }
}

#Preview {
    PlanetsView(planets: MockPlanetGenerator().generateGalaxy())
}
