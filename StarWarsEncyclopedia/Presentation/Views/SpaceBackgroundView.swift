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
