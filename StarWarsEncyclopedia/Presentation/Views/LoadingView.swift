//
//  LoadingView.swift
//  StarWarsEncyclopedia
//
//  Created by Federico De Luca on 3/3/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            CustomColor.black.opacity(0.8)
            ProgressView {
                Text(localizedStringKey: "loadingMessage")
                    .customStyleWithSize(size: 16,
                                         lineLimit: 2)
            }
            .padding(.horizontal, 32)
        }
        .ignoresSafeArea()
    }
}
