import Foundation

extension UnkeyedDecodingContainer {

    // MARK: - Instance Methods

    internal mutating func decode<T: Decodable>() throws -> T {
        return try decode(T.self)
    }

    internal mutating func decodeIfPresent<T: Decodable>(_ type: T.Type) throws -> T? {
        return try decodeIfPresent(T.self)
    }
}
