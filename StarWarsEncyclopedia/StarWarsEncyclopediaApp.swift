//
//  StarWarsEncyclopediaApp.swift
//  StarWarsEncyclopedia
//
//  Created by Personal on 19/10/23.
//

import SwiftUI

@main
struct StarWarsEncyclopediaApp: App {
    var body: some Scene {
        WindowGroup {
            CharactersView(characters: MockCharacterGenerator().generateTroopers())
        }
    }
}
