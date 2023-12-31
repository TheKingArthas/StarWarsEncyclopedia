import Foundation
import SwiftUI

struct CustomTypography {
    static var h1: Font {
        CustomFont.startJedi(size: 32)
    }
    static var body: Font {
        CustomFont.startJedi(size: 16)
    }
    
    private init() {}
}

fileprivate struct CustomFont {
    static func startJedi(size: CGFloat) -> Font {
        .custom("Starjedi", size: size)
    }
}

extension Text {
    func h1Style(color: Color = CustomColor.starWarsYellow) -> some View {
        self
            .lineLimit(1)
            .font(CustomTypography.h1)
            .foregroundStyle(color)
            .minimumScaleFactor(0.7)
    }
    
    func bodyStyle(color: Color = .white) -> some View {
        self
            .font(CustomTypography.body)
            .foregroundStyle(color)
    }
}
