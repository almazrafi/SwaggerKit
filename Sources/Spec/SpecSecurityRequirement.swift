import Foundation

/// An object representing a security requirement.
/// Get more info: https://swagger.io/specification/#securityRequirementObject
public struct SpecSecurityRequirement: Codable, Equatable, Changeable {

    // MARK: - Instance Properties

    /// Name of the corresponding security scheme.
    public var name: String?

    /// List of scope names required for the execution.
    /// Must be empty if the security scheme type is not OAuth2 or OpenIDConnect.s
    public var scopes: [String]?

    // MARK: - Initializers

    /// Creates a new instance with the provided values.
    public init(name: String? = nil, scopes: [String]? = nil) {
        self.name = name
        self.scopes = scopes
    }

    /// Creates a new instance by decoding from the given decoder.
    ///
    /// This initializer throws an error if reading from the decoder fails, or
    /// if the data read is corrupted or otherwise invalid.
    ///
    /// - Parameter decoder: The decoder to read data from.
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)

        if let nameCodingKey = container.allKeys.first {
            name = nameCodingKey.stringValue
            scopes = try container.decode(forKey: nameCodingKey)
        } else {
            name = nil
            scopes = nil
        }
    }

    // MARK: - Instance Methods

    /// Encodes this instance into the given encoder.
    ///
    /// This function throws an error if any values are invalid for the given encoder's format.
    ///
    /// - Parameter encoder: The encoder to write data to.
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)

        if let name = name {
            try container.encode(scopes ?? [], forKey: AnyCodingKey(name))
        }
    }
}
