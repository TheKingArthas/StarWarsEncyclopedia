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
    func titleStyle(color: Color = CustomColor.starWarsYellow,
                    lineLimit: Int = 2) -> some View {
        self
            .multilineTextAlignment(.center)
            .lineLimit(lineLimit)
            .lineSpacing(0)
            .font(CustomTypography.title)
            .foregroundStyle(color)
            .minimumScaleFactor(0.0)
    }
    
    func subtitleStyle(color: Color = CustomColor.starWarsYellow,
                    lineLimit: Int = 2) -> some View {
        self
            .multilineTextAlignment(.center)
            .lineLimit(lineLimit)
            .font(CustomTypography.subtitle)
            .foregroundStyle(color)
            .minimumScaleFactor(0.0)
    }
    
    func h1Style(color: Color = CustomColor.starWarsYellow,
                 lineLimit: Int = 1) -> some View {
        self
            .multilineTextAlignment(.center)
            .lineLimit(lineLimit)
            .font(CustomTypography.h1)
            .foregroundStyle(color)
            .minimumScaleFactor(0.7)
    }
    
    func bodyStyle(color: Color = .white) -> some View {
        self
            .font(CustomTypography.body)
            .foregroundStyle(color)
    }
    
    func customStyle(color: Color = CustomColor.starWarsYellow,
                     lineLimit: Int = 1,
                     size: CGFloat = 32.0) -> some View {
        self
            .multilineTextAlignment(.center)
            .lineLimit(lineLimit)
            .font(CustomTypography.custom(size: size))
            .foregroundStyle(color)
            .minimumScaleFactor(0.7)
    }
}
