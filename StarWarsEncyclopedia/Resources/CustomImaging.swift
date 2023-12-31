import Foundation
import SwiftUI

struct CustomImaging {
    static var genderFemale: Image {
        Image("GenderFemale")
    }
    static var genderMale: Image {
        Image("GenderMale")
    }
    static var moreButton: Image {
        Image(systemName: "chevron.forward.circle.fill")
            .renderingMode(.template)
    }
}
