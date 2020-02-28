import Foundation

internal protocol SpecComponentRegistry {

    // MARK: - Instance Methods

    func registerComponent<T: Codable>(_ component: SpecComponent<T>, at codingPath: [CodingKey])
}
