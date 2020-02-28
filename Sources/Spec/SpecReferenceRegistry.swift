import Foundation

internal protocol SpecReferenceRegistry {

    // MARK: - Instance Methods

    func registerReference<T: Codable>(_ reference: SpecReference<T>)
}
