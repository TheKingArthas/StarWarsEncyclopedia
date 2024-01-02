//
//  StructGenerator.swift
//  StarWarsEncyclopedia
//
//  Created by Federico De Luca on 29/12/23.
//

import Foundation

protocol StructGenerator<T> {
    associatedtype T: Any
    var generatorCount: Int { get }
    
    func generate() -> T
}
