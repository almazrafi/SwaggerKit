import Foundation

internal protocol SwaggerComponentRegistry {

    // MARK: - Instance Methods

    func registerComponent<T: Codable>(_ component: SwaggerComponent<T>, at codingPath: [CodingKey])
}
