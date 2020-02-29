import Foundation

/// An object representing a component.
public final class SpecComponent<T: Codable>: Codable {

    // MARK: - Nested Types

    private enum CodingKeys: String, CodingKey {
        case reference = "$ref"
    }

    // MARK: - Instance Properties

    /// Type of the component.
    public let type: SpecComponentType<T>

    /// Resolved value of the component.
    public var value: T? {
        switch self.type {
        case let .reference(reference):
            return reference.component?.value

        case let .value(value):
            return value
        }
    }

    // MARK: - Initializers

    /// Creates a new instance with the provided value.
    public init(value: T) {
        self.type = .value(value)
    }

    /// Creates a new instance with the provided reference URI.
    public init(referenceURI: String) {
        self.type = .reference(SpecReference(uri: referenceURI))
    }

    /// Creates a new instance with the provided type.
    public convenience init(type: SpecComponentType<T>) {
        switch type {
        case let .reference(reference):
            self.init(referenceURI: reference.uri)

        case let .value(value):
            self.init(value: value)
        }
    }

    /// Creates a new instance by decoding from the given decoder.
    ///
    /// This initializer throws an error if reading from the decoder fails, or
    /// if the data read is corrupted or otherwise invalid.
    ///
    /// - Parameter decoder: The decoder to read data from.
    public required init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: CodingKeys.self)

        if let reference = try container?.decodeIfPresent(SpecReference<T>.self, forKey: .reference) {
            type = .reference(reference)
        } else {
            type = .value(try T(from: decoder))
        }

        if let registry = decoder.userInfo[.specComponentRegistry] as? SpecComponentRegistry {
            registry.registerComponent(self, at: decoder.codingPath)
        }
    }

    // MARK: - Instance Methods

    /// Encodes this instance into the given encoder.
    ///
    /// This function throws an error if any values are invalid for the given encoder's format.
    ///
    /// - Parameter encoder: The encoder to write data to.
    public func encode(to encoder: Encoder) throws {
        switch type {
        case let .reference(reference):
            var container = encoder.container(keyedBy: CodingKeys.self)

            try container.encode(reference, forKey: .reference)

        case let .value(value):
            try value.encode(to: encoder)
        }
    }
}

extension SpecComponent: Equatable where T: Equatable {

    // MARK: - Type Methods

    /// Returns a Boolean value indicating whether two instances are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`, `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A instance to compare.
    ///   - rhs: Another instance to compare.
    public static func == (lhs: SpecComponent<T>, rhs: SpecComponent<T>) -> Bool {
        return lhs.type == rhs.type
    }
}

extension CodingUserInfoKey {

    // MARK: - Type Properties

    internal static let specComponentRegistry = CodingUserInfoKey(rawValue: "SwaggerKit.specComponentRegistry")!
}
