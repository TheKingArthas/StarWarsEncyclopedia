//
//  NavigationBarConfiguration.swift
//  StarWarsEncyclopedia
//
//  Created by Federico De Luca on 1/1/24.
//

import SwiftUI

struct HomeView: View {
    init() {
        NavigationBarConfiguration.configureTitle()
    }
    
    var body: some View {
        mainView
            .background {
                SpaceBackgroundView()
            }
    }
    
    private var mainView: some View {
        VStack {
            NavigationStack {
                VStack {
                    titleView()
                        .padding(.top, 32)
                    NavigationLink {
                        CharactersView(characters: MockCharacterGenerator().generateTroopers())
                    } label: {
                        tileView(title: "Characters", background: CustomImaging.planets)
                    }
                    NavigationLink {
                        EmptyView()
                    } label: {
                        tileView(title: "Species", background: CustomImaging.planets)
                    }
                    NavigationLink {
                        PlanetsView(planets: MockPlanetGenerator().generateGalaxy())
                    } label: {
                        tileView(title: "Planets", background: CustomImaging.planets)
                    }
                }
            }
        }
    }
    
    private func titleView() -> some View {
        Text("Star Wars Encyclopedia")
            .h1Style()
            .padding(.horizontal, 24)
    }
    
    private func tileView(title: String, background: Image) -> some View {
        HStack {
            Text(title)
            Spacer()
        }
        .containerRelativeFrame(.vertical, count: 3, spacing: 16)
        .background {
            background
                .resizable()
                .scaledToFill()
        }
    }
}

#Preview {
    HomeView()
}
