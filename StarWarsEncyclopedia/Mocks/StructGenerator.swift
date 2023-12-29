import Foundation

protocol StructGenerator<T> {
    associatedtype T: Any
    var generatorCount: Int { get }
    
    func generate() -> T
}
