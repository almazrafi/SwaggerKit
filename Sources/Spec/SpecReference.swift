import Foundation

/// An object representing a reference to another component.
public final class SpecReference<T: Codable>: Codable {

    // MARK: - Instance Properties

    public private(set) weak var component: SpecComponent<T>?

    /// URI of the referenced component according to the [RFC 3986](https://tools.ietf.org/html/rfc3986).
    public let uri: String

    // MARK: - Initializers

    /// Creates a new instance with the provided URI.
    public init(uri: String) {
        self.uri = uri
    }

    /// Creates a new instance by decoding from the given decoder.
    ///
    /// This initializer throws an error if reading from the decoder fails, or
    /// if the data read is corrupted or otherwise invalid.
    ///
    /// - Parameter decoder: The decoder to read data from.
    public required init(from decoder: Decoder) throws {
        uri = try String(from: decoder)

        guard !uri.isEmpty else {
            let errorContext = DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Reference URI is empty"
            )

            throw DecodingError.dataCorrupted(errorContext)
        }

        if let registry = decoder.userInfo[.specReferenceRegistry] as? SpecReferenceRegistry {
            registry.registerReference(self)
        }
    }

    // MARK: - Instance Methods

    internal func resolve(with component: SpecComponent<T>) {
        self.component = component
    }

    /// Encodes this instance into the given encoder.
    ///
    /// This function throws an error if any values are invalid for the given encoder's format.
    ///
    /// - Parameter encoder: The encoder to write data to.
    public func encode(to encoder: Encoder) throws {
        guard !uri.isEmpty else {
            let errorContext = EncodingError.Context(
                codingPath: encoder.codingPath,
                debugDescription: "Reference URI is empty"
            )

            throw EncodingError.invalidValue(uri, errorContext)
        }

        try uri.encode(to: encoder)
    }
}

extension SpecReference: Equatable {

    // MARK: - Type Methods

    /// Returns a Boolean value indicating whether two instances are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`, `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A instance to compare.
    ///   - rhs: Another instance to compare.
    public static func == (lhs: SpecReference<T>, rhs: SpecReference<T>) -> Bool {
        return lhs.uri == rhs.uri
    }
}

extension CodingUserInfoKey {

    // MARK: - Type Properties

    internal static let specReferenceRegistry = CodingUserInfoKey(rawValue: "SwaggerKit.specReferenceRegistry")!
}
