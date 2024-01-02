//
//  NavigationBarConfiguration.swift
//  StarWarsEncyclopedia
//
//  Created by Federico De Luca on 1/1/24.
//

import Foundation
import UIKit

class NavigationBarConfiguration {
    static func configureTitle(_ color: UIColor = .white) {
        let fontSize: CGFloat = 24
        let font = UIFont(name: "Starjedi", size: fontSize) ?? .boldSystemFont(ofSize: fontSize)
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: color,
                                                            NSAttributedString.Key.font: font]
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: color,
                                                                 NSAttributedString.Key.font: font]
    }
    
    private init() {}
}
