//
//  SpaceBackgroundView.swift
//  StarWarsEncyclopedia
//
//  Created by Federico De Luca on 31/12/23.
//

import SwiftUI

struct SpaceBackgroundView: View {
    var body: some View {
        ZStack {
            CustomImaging.spaceBackground
                .opacity(0.9)
            LinearGradient(gradient: Gradient(colors: [Color.clear,
                                                       Color.black,
                                                       CustomColor.darkerGray]),
                           startPoint: .top,
                           endPoint: .bottom)
        }
    }
}

#Preview {
    SpaceBackgroundView()
}
