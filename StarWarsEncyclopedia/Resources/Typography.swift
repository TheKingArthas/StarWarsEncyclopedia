import Foundation
import SwiftUI

class Typography {
    static var h1: Font {
        .custom("Starjedi", size: 32)
    }
    static var body: Font {
        .custom("Starjedi", size: 16)
    }
    
    private init() {}
}

extension Text {
    func h1Style(color: Color = .starWarsYellow) -> some View {
        self
            .font(Typography.h1)
            .foregroundStyle(color)
    }
    
    func bodyStyle(color: Color = .white) -> some View {
        self
            .font(Typography.body)
            .foregroundStyle(color)
    }
}
