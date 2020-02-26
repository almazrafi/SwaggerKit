import Foundation

extension KeyedDecodingContainerProtocol {

    // MARK: - Instance Methods

    internal func decode<T: Decodable>(forKey key: Key) throws -> T {
        return try decode(T.self, forKey: key)
    }

    internal func decodeIfPresent<T: Decodable>(forKey key: Self.Key) throws -> T? {
        return try decodeIfPresent(T.self, forKey: key)
    }
}
