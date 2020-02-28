import Foundation

/// An object representing a schema.
/// Schema allows the definition of input and output data types.
/// These types can be objects, but also primitives and arrays.
/// Get more info: https://swagger.io/specification/#schemaObject
public struct SpecSchema: Codable, Equatable {

    // MARK: - Nested Types

    private enum CodingKeys: String, CodingKey {
        case type

        case arrayItems = "items"
        case objectProperties = "properties"

        case allOf
        case anyOf
        case oneOf

        case discriminator
    }

    // MARK: - Type Properties

    /// Default schema of any type.
    public static let any = SpecSchema(
        type: .any(SpecAnySchema()),
        metadata: SpecSchemaMetadata()
    )

    // MARK: - Instance Properties

    private var extensionsContainer: SpecExtensionsContainer

    /// The type of the schema.
    public var type: SpecSchemaType

    /// Metadata to describe the schema.
    public var metadata: SpecSchemaMetadata

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
        type: SpecSchemaType,
        metadata: SpecSchemaMetadata = .empty,
        extensions: [String: Any] = [:]
    ) {
        self.extensionsContainer = SpecExtensionsContainer(content: extensions)

        self.type = type
        self.metadata = metadata
    }

    /// Creates a new instance by decoding from the given decoder.
    ///
    /// This initializer throws an error if reading from the decoder fails, or
    /// if the data read is corrupted or otherwise invalid.
    ///
    /// - Parameter decoder: The decoder to read data from.
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        switch try container.decodeIfPresent(String.self, forKey: .type) {
        case SpecBooleanSchema.typeCodingValue:
            type = .boolean(try SpecBooleanSchema(from: decoder))

        case SpecIntegerSchema.typeCodingValue:
            type = .integer(try SpecIntegerSchema(from: decoder))

        case SpecNumberSchema.typeCodingValue:
            type = .number(try SpecNumberSchema(from: decoder))

        case SpecStringSchema.typeCodingValue:
            type = .string(try SpecStringSchema(from: decoder))

        case SpecArraySchema.typeCodingValue:
            type = .array(try SpecArraySchema(from: decoder))

        case SpecObjectSchema.typeCodingValue:
            type = .object(try SpecObjectSchema(from: decoder))

        case nil where container.contains(.arrayItems):
            type = .array(try SpecArraySchema(from: decoder))

        case nil where container.contains(.objectProperties):
            type = .object(try SpecObjectSchema(from: decoder))

        case nil where container.contains(.allOf):
            type = .allOf(schemas: try container.decode(forKey: .allOf))

        case nil where container.contains(.anyOf):
            type = .anyOf(
                schemas: try container.decode(forKey: .anyOf),
                discriminator: try container.decodeIfPresent(forKey: .discriminator)
            )

        case nil where container.contains(.oneOf):
            type = .oneOf(
                schemas: try container.decode(forKey: .oneOf),
                discriminator: try container.decodeIfPresent(forKey: .discriminator)
            )

        default:
            type = .any(try SpecAnySchema(from: decoder))
        }

        metadata = try SpecSchemaMetadata(from: decoder)
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

        switch type {
        case let .boolean(booleanSchema):
            try container.encode(SpecBooleanSchema.typeCodingValue, forKey: .type)
            try booleanSchema.encode(to: encoder)

        case let .integer(integerSchema):
            try container.encode(SpecIntegerSchema.typeCodingValue, forKey: .type)
            try integerSchema.encode(to: encoder)

        case let .number(numberSchema):
            try container.encode(SpecNumberSchema.typeCodingValue, forKey: .type)
            try numberSchema.encode(to: encoder)

        case let .string(stringSchema):
            try container.encode(SpecStringSchema.typeCodingValue, forKey: .type)
            try stringSchema.encode(to: encoder)

        case let .array(arraySchema):
            try container.encode(SpecArraySchema.typeCodingValue, forKey: .type)
            try arraySchema.encode(to: encoder)

        case let .object(objectSchema):
            try container.encode(SpecObjectSchema.typeCodingValue, forKey: .type)
            try objectSchema.encode(to: encoder)

        case let .allOf(schemas):
            try container.encode(schemas, forKey: .allOf)

        case let .anyOf(schemas, discriminator):
            try container.encode(schemas, forKey: .anyOf)
            try container.encodeIfPresent(discriminator, forKey: .discriminator)

        case let .oneOf(schemas, discriminator):
            try container.encode(schemas, forKey: .oneOf)
            try container.encodeIfPresent(discriminator, forKey: .discriminator)

        case let .any(anySchema):
            try anySchema.encode(to: encoder)
        }

        try metadata.encode(to: encoder)
        try extensionsContainer.encode(to: encoder)
    }
}
