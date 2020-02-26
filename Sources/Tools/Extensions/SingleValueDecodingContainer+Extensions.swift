import Foundation

extension SingleValueDecodingContainer {

    // MARK: - Instance Methods

    internal func decode<T: Decodable>() throws -> T {
        return try decode(T.self)
    }
}
