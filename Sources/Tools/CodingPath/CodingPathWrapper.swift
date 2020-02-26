import Foundation

internal struct CodingPathWrapper<T: Decodable>: Decodable {

    // MARK: - Instance Properties

    internal let value: T

    // MARK: - Initializers

    internal init(from decoder: Decoder) throws {
        if var codingPath = decoder.userInfo[.codingPath] as? [String], !codingPath.isEmpty {
            var container = try decoder.container(keyedBy: AnyCodingKey.self)

            while codingPath.count > 1 {
                container = try container.nestedContainer(
                    keyedBy: AnyCodingKey.self,
                    forKey: AnyCodingKey(codingPath[0])
                )

                codingPath = Array(codingPath.dropFirst())
            }

            value = try container.decode(T.self, forKey: AnyCodingKey(codingPath[0]))
        } else {
            value = try T(from: decoder)
        }
    }
}

extension CodingUserInfoKey {

    // MARK: - Type Properties

    internal static let codingPath = CodingUserInfoKey(rawValue: "codingPath")!
}
