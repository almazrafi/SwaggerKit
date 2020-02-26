import Foundation

/// An object representing an object schema type.
/// Get more info: https://swagger.io/specification/#schemaObject
public struct SwaggerObjectSchema: Codable, Equatable {

    // MARK: - Nested Types

    private enum CodingKeys: String, CodingKey {
        case properties
        case requiredProperties = "required"
        case additionalProperties

        case minPropertyCount = "minProperties"
        case maxPropertyCount = "maxProperties"

        case discriminator = "discriminator"
    }

    // MARK: - Type Properties

    internal static let typeCodingValue = "object"

    // MARK: - Instance Properties

    /// A map of property schemas where the key is the fixed property name.
    /// If the value is nil, the object is free-form.
    public var properties: [String: SwaggerComponent<SwaggerSchema>]?

    /// A list of required properties. By default, all object properties are optional.
    /// An empty list is not valid. If all properties are optional, this value should not be specified.
    public var requiredProperties: [String]?

    /// Specifies the type of values in key/value pairs.
    public var additionalProperties: SwaggerComponent<SwaggerSchema>?

    /// The minimum number of properties allowed in an object.
    /// This can be useful when using `additionalProperties` or free-form objects.
    public var minPropertyCount: Int?

    /// The maximum number of properties allowed in an object.
    /// This can be useful when using `additionalProperties` or free-form objects.
    public var maxPropertyCount: Int?

    /// Adds support for polymorphism.
    /// The discriminator is an object name that is used to differentiate between other schemas
    /// which may satisfy the payload description.
    public var discriminator: SwaggerSchemaDiscriminator?

    // MARK: - Initializers

    /// Creates a new instance with the provided values.
    public init(
        properties: [String: SwaggerComponent<SwaggerSchema>]? = nil,
        requiredProperties: [String]? = nil,
        additionalProperties: SwaggerComponent<SwaggerSchema>? = nil,
        minPropertyCount: Int? = nil,
        maxPropertyCount: Int? = nil,
        discriminator: SwaggerSchemaDiscriminator? = nil
    ) {
        self.properties = properties
        self.requiredProperties = requiredProperties
        self.additionalProperties = additionalProperties

        self.minPropertyCount = minPropertyCount
        self.maxPropertyCount = maxPropertyCount

        self.discriminator = discriminator
    }

    /// Creates a new instance by decoding from the given decoder.
    ///
    /// This initializer throws an error if reading from the decoder fails, or
    /// if the data read is corrupted or otherwise invalid.
    ///
    /// - Parameter decoder: The decoder to read data from.
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        properties = try container.decodeIfPresent(forKey: .properties)
        requiredProperties = try container.decodeIfPresent(forKey: .requiredProperties)

        switch try? container.decodeIfPresent(Bool.self, forKey: .additionalProperties) {
        case true?:
            additionalProperties = SwaggerComponent(type: .value(.any))

        case false?:
            additionalProperties = nil

        case nil:
            additionalProperties = try container.decodeIfPresent(forKey: .additionalProperties)

            if additionalProperties == nil {
                additionalProperties = SwaggerComponent(type: .value(.any))
            }
        }

        minPropertyCount = try container.decodeIfPresent(forKey: .minPropertyCount)
        maxPropertyCount = try container.decodeIfPresent(forKey: .maxPropertyCount)

        discriminator = try container.decodeIfPresent(forKey: .discriminator)
    }

    // MARK: - Instance Methods

    /// Encodes this instance into the given encoder.
    ///
    /// This function throws an error if any values are invalid for the given encoder's format.
    ///
    /// - Parameter encoder: The encoder to write data to.
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(properties, forKey: .properties)
        try container.encodeIfPresent(requiredProperties, forKey: .requiredProperties)

        switch additionalProperties {
        case let component? where component.value == .any:
            try container.encode(true, forKey: .additionalProperties)

        case let component?:
            try container.encode(component, forKey: .additionalProperties)

        case nil:
            try container.encode(false, forKey: .additionalProperties)
        }

        try container.encodeIfPresent(minPropertyCount, forKey: .minPropertyCount)
        try container.encodeIfPresent(maxPropertyCount, forKey: .maxPropertyCount)

        try container.encodeIfPresent(discriminator, forKey: .discriminator)
    }
}
