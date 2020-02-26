import Foundation

internal struct SwaggerExtensionsContainer: Codable {

    // MARK: - Nested Types

    private enum Constants {
        static let codingKeyPrefix = "x-"
    }

    // MARK: - Instance Properties

    internal var content: [String: Any]

    // MARK: - Initializers

    internal init(content: [String: Any] = [:]) {
        self.content = content
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)

        let codingKeys = container
            .allKeys
            .filter { $0.stringValue.hasPrefix(Constants.codingKeyPrefix) }

        content = [:]

        for codingKey in codingKeys {
            let key = codingKey.stringValue.suffix(from: Constants.codingKeyPrefix.count)
            let value = try container.decode(AnyCodable.self, forKey: codingKey).value

            content[key] = value
        }
    }

    // MARK: - Instance Methods

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)

        for (key, value) in content {
            try container.encode(
                AnyCodable(value),
                forKey: AnyCodingKey(Constants.codingKeyPrefix.appending(key))
            )
        }
    }

    internal func contains(codingKey: String) -> Bool {
        return content[codingKey.suffix(from: Constants.codingKeyPrefix.count)] != nil
    }
}

extension SwaggerExtensionsContainer: Equatable {

    // MARK: - Type Methods

    internal static func == (lhs: SwaggerExtensionsContainer, rhs: SwaggerExtensionsContainer) -> Bool {
        return AnyCodable(lhs.content) == AnyCodable(rhs.content)
    }
}
