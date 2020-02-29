import Foundation

/// An object representing a variable for server URL template substitution.
/// Get more info: https://swagger.io/specification/#serverVariableObject
public struct SpecServerVariable: Codable, Equatable, Changeable {

    // MARK: - Nested Types

    private enum CodingKeys: String, CodingKey {
        case defaultValue = "default"
        case enumeration = "enum"
        case description
    }

    // MARK: - Instance Properties

    private var extensionsContainer: SpecExtensionsContainer

    /// The default value to use for substitution, which shall be sent if an alternate value is not supplied.
    public var defaultValue: String

    /// An enumeration of string values to be used if the substitution options are from a limited set.
    public var enumeration: [String]?

    /// Description for the server variable.
    /// [CommonMark syntax](http://spec.commonmark.org/) may be used for rich text representation.
    public var description: String?

    /// The extensions properties.
    /// Keys will be prefixed by "x-" when encoding.
    /// Values can be a primitive, an array or an object. Can have any valid JSON format value.
    public var extensions: [String: Any] {
        get { extensionsContainer.content }
        set { extensionsContainer.content = newValue }
    }

    // MARK: - Initializers

    /// Creates a new instance with the provided values.
    public init(
        defaultValue: String,
        enumeration: [String]? = nil,
        description: String? = nil,
        extensions: [String: Any] = [:]
    ) {
        self.extensionsContainer = SpecExtensionsContainer(content: extensions)

        self.defaultValue = defaultValue
        self.enumeration = enumeration
        self.description = description
    }

    /// Creates a new instance by decoding from the given decoder.
    ///
    /// This initializer throws an error if reading from the decoder fails, or
    /// if the data read is corrupted or otherwise invalid.
    ///
    /// - Parameter decoder: The decoder to read data from.
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        defaultValue = try container.decode(forKey: .defaultValue)
        enumeration = try container.decodeIfPresent(forKey: .enumeration)
        description = try container.decodeIfPresent(forKey: .description)

        extensionsContainer = try SpecExtensionsContainer(from: decoder)
    }

    // MARK: - Instance Methods

    /// Encodes this instance into the given encoder.
    ///
    /// This function throws an error if any values are invalid for the given encoder's format.
    ///
    /// - Parameter encoder: The encoder to write data to.
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(defaultValue, forKey: .defaultValue)
        try container.encodeIfPresent(enumeration, forKey: .enumeration)
        try container.encodeIfPresent(description, forKey: .description)

        try extensionsContainer.encode(to: encoder)
    }
}
