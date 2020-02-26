import Foundation

/// An object representing a discriminator.
/// When request bodies or response payloads may be one of a number of different schemas,
/// a discriminator object can be used to aid in serialization, deserialization, and validation.
/// The discriminator is a specific object in a schema which is used to inform of an alternative schema
/// based on the value associated with it.
/// When using the discriminator, inline schemas will not be considered.
/// Get more info: https://swagger.io/specification/#discriminatorObject
public struct SwaggerSchemaDiscriminator: Codable, Equatable {

    // MARK: - Nested Types

    private enum CodingKeys: String, CodingKey {
        case propertyName
        case mapping
    }

    // MARK: - Instance Properties

    private var extensionsContainer: SwaggerExtensionsContainer

    /// The name of the property in the payload that will hold the discriminator value.
    public var propertyName: String

    /// A map between a property value and schema name or reference.
    public var mapping: [String: SwaggerReference<SwaggerSchema>]?

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
        propertyName: String,
        mapping: [String: SwaggerReference<SwaggerSchema>]? = nil,
        extensions: [String: Any] = [:]
    ) {
        self.extensionsContainer = SwaggerExtensionsContainer(content: extensions)

        self.propertyName = propertyName
        self.mapping = mapping
    }

    /// Creates a new instance by decoding from the given decoder.
    ///
    /// This initializer throws an error if reading from the decoder fails, or
    /// if the data read is corrupted or otherwise invalid.
    ///
    /// - Parameter decoder: The decoder to read data from.
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        propertyName = try container.decode(forKey: .propertyName)
        mapping = try container.decodeIfPresent(forKey: .mapping)

        extensionsContainer = try SwaggerExtensionsContainer(from: decoder)
    }

    // MARK: - Instance Methods

    /// Encodes this instance into the given encoder.
    ///
    /// This function throws an error if any values are invalid for the given encoder's format.
    ///
    /// - Parameter encoder: The encoder to write data to.
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(propertyName, forKey: .propertyName)
        try container.encodeIfPresent(mapping, forKey: .mapping)

        try extensionsContainer.encode(to: encoder)
    }
}
