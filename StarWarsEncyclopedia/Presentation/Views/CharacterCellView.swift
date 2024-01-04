//
//  CustomCellView.swift
//  StarWarsEncyclopedia
//
//  Created by Federico De Luca on 30/12/23.
//

import SwiftUI

struct CustomCellView: View {
    @State private var avatarRotationDegrees: Double
    private var title: String
    
    init(title: String) {
        avatarRotationDegrees = 0.0
        self.title = title
    }
    
    var body: some View {
        mainView
            .onAppear {
                startAvatarRotation()
            }
    }
    
    private var mainView: some View {
        ZStack {
            CustomColor.darkerGray
            HStack {
                characterAvatarView()
                    .padding(.vertical, 8)
                Spacer()
                titleView()
                Spacer()
            }
            .padding(.horizontal, 16)
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
    private func characterAvatarView() -> some View {
        Image(.jarJarBinks)
            .resizable()
            .scaledToFit()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
            .rotation3DEffect(.degrees(avatarRotationDegrees), axis: (x: 0, y: 1, z: 0))
    }
    
    private func titleView() -> some View {
        Text(title)
            .bodyStyle()
            .lineLimit(1)
            .minimumScaleFactor(0.8)
    }
    
    func startAvatarRotation() {
        withAnimation(Animation.linear(duration: 10).repeatForever(autoreverses: false)) {
            avatarRotationDegrees = 360
        }
    }
}

#Preview {
    CustomCellView(title: MockCharacterGenerator().generate().name)
}
