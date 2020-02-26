import Foundation

internal protocol SwaggerReferenceRegistry {

    // MARK: - Instance Methods

    func registerReference<T: Codable>(_ reference: SwaggerReference<T>)
}
