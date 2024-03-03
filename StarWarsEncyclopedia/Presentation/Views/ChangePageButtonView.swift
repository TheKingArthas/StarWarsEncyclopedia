//
//  ChangePageButton.swift
//  StarWarsEncyclopedia
//
//  Created by Federico De Luca on 3/3/24.
//

import SwiftUI

enum PointingDiretion: String {
    case left
    case right
}

struct ChangePageButtonView: View {
    let pointingDirection: PointingDiretion
    let isDisabled: Bool
    let action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "arrowtriangle.\(pointingDirection).fill")
                .foregroundColor(CustomColor.white)
                .opacity(isDisabled ? 0.3 : 1.0)
        }
        .disabled(isDisabled)
    }
}

#Preview {
    ChangePageButtonView(pointingDirection: .left,
                         isDisabled: false,
                         action: {
        print("Button pressed")
    })
    .background {
        Color.black
    }
}
