//
//  CustomSystemAlert.swift
//  StarWarsEncyclopedia
//
//  Created by Federico De Luca on 15/1/24.
//

import Foundation
import SwiftUI

struct CustomSystemAlert {
    private static func errorDescription(_ error: Error) -> String {
        switch error {
        case ApiError.invalidUrl:
            return "Invalid URL"
        case ApiError.invalidResponse:
            return "Invalid response"
        case ApiError.invalidData:
            return "Invalid data"
        default:
            return "Unexpected error"
        }
    }
    
    func alertFromError(_ error: Error, shouldShowAlert: Binding<Bool>) -> Alert {
        let errorDescription = Self.errorDescription(error)
        let primaryButton: Alert.Button = .default(Text("OK"),
                                                   action: {
            shouldShowAlert.wrappedValue = false
        })
        return Alert(title: Text("Error"),
                     message: Text(errorDescription),
                     dismissButton: primaryButton)
    }
}
