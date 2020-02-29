import Foundation

/// An object representing a metadata that allows for more fine-tuned XML model definitions.
/// When using arrays, XML element names are not inferred (for singular/plural forms)
/// and the `name` property should be used to add that information.
/// Get more info: https://swagger.io/specification/#xmlObject
public struct SpecSchemaXML: Codable, Equatable, Changeable {

    // MARK: - Nested Types

    private enum CodingKeys: String, CodingKey {
        case name
        case namePrefix = "prefix"
        case namespaceURI = "namespace"

        case isAttribute = "attribute"
        case isWrapped = "wrapped"
    }

    // MARK: - Instance Properties

    private var extensionsContainer: SpecExtensionsContainer

    /// Replaces the name of the element/attribute used for the described schema property.
    /// When defined within `items`, it will affect the name of the individual XML elements within the list.
    /// When defined alongside type being `array` (outside the `items`),
    /// it will affect the wrapping element and only if `wrapped` is `true`.
    /// If `wrapped` is `false`, it will be ignored.
    public var name: String?

    /// The prefix to be used for the `name`.
    public var namePrefix: String?

    /// The URI of the namespace definition.
    public var namespaceURI: String?

    /// Declares whether the property definition translates to an attribute instead of an element.
    /// Default value is `false`.
    public var isAttribute: Bool?

    /// Signifies whether the array is wrapped (for example, `<books><book/><book/></books>`)
    /// or unwrapped (`<book/><book/>`).
    /// The definition takes effect only when defined alongside `type` being `array` (outside the `items`).
    /// Default value is `false`.
    public var isWrapped: Bool?

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
        name: String? = nil,
        namePrefix: String? = nil,
        namespaceURI: String? = nil,
        isAttribute: Bool? = nil,
        isWrapped: Bool? = nil,
        extensions: [String: Any] = [:]
    ) {
        self.extensionsContainer = SpecExtensionsContainer(content: extensions)

        self.name = name
        self.namePrefix = namePrefix
        self.namespaceURI = namespaceURI

        self.isAttribute = isAttribute
        self.isWrapped = isWrapped
    }

    /// Creates a new instance by decoding from the given decoder.
    ///
    /// This initializer throws an error if reading from the decoder fails, or
    /// if the data read is corrupted or otherwise invalid.
    ///
    /// - Parameter decoder: The decoder to read data from.
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        name = try container.decodeIfPresent(forKey: .name)
        namePrefix = try container.decodeIfPresent(forKey: .namePrefix)
        namespaceURI = try container.decodeIfPresent(forKey: .namespaceURI)

        isAttribute = try container.decodeIfPresent(forKey: .isAttribute)
        isWrapped = try container.decodeIfPresent(forKey: .isWrapped)

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

        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(namePrefix, forKey: .namePrefix)
        try container.encodeIfPresent(namespaceURI, forKey: .namespaceURI)

        try container.encodeIfPresent(isAttribute, forKey: .isAttribute)
        try container.encodeIfPresent(isWrapped, forKey: .isWrapped)

        try extensionsContainer.encode(to: encoder)
    }
}
