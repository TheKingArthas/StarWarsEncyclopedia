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
        CharactersView(characters: MockCharacterGenerator().generateTroopers())
    }
}

#Preview {
    HomeView()
}
