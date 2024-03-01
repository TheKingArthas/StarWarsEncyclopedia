//
//  CustomTypography.swift
//  StarWarsEncyclopedia
//
//  Created by Federico De Luca on 31/12/23.
//

import Foundation
import SwiftUI

struct CustomTypography {
    static var title: Font {
        CustomFont.startJedi(size: 80)
    }
    static var subtitle: Font {
        CustomFont.startJedi(size: 24)
    }
    static var h1: Font {
        CustomFont.startJedi(size: 32)
    }
    static var body: Font {
        CustomFont.startJedi(size: 16)
    }
    
    static func custom(size: CGFloat) -> Font {
        CustomFont.startJedi(size: size)
    }
    
    private init() {}
}

struct CustomFont {
    static func startJedi(size: CGFloat) -> Font {
        .custom("Starjedi", size: size)
    }
}

extension Text {
    func titleStyle() -> some View {
        self
            .customStyle(color: CustomColor.starWarsYellow,
                         font: CustomTypography.title,
                         lineLimit: 2)
    }
    
    func subtitleStyle() -> some View {
        self
            .customStyle(color: CustomColor.starWarsYellow,
                         font: CustomTypography.subtitle,
                         lineLimit: 2)
    }
    
    func h1Style() -> some View {
        self
            .customStyle(color: CustomColor.starWarsYellow,
                         font: CustomTypography.h1)
    }
    
    func bodyStyle(color: Color = .white) -> some View {
        self
            .customStyle()
    }
    
    func customStyleWithSize(color: Color = .white,
                             size: CGFloat,
                             lineLimit: Int = 1) -> some View {
        customStyle(color: color,
                    font: CustomTypography.custom(size: size),
                    lineLimit: lineLimit)
    }
    
    private func customStyle(color: Color = .white,
                             font: Font = CustomTypography.body,
                             lineLimit: Int = 1) -> some View {
        self
            .foregroundStyle(color)
            .font(font)
            .lineLimit(lineLimit)
            .multilineTextAlignment(.center)
            .minimumScaleFactor(0.7)
    }
}
