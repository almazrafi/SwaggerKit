import Foundation

/// An object representing a media type of the request body.
/// Each media type object provides schema and examples for the media type identified by its key.
/// Get more info: https://swagger.io/specification/#mediaTypeObject
public struct SwaggerRequestBodyMediaType: Codable, Equatable {

    // MARK: - Nested Types

    private enum CodingKeys: String, CodingKey {
        case schema
        case encoding
        case examples
        case example
    }

    // MARK: - Instance Properties

    private var extensionsContainer: SwaggerExtensionsContainer

    /// The schema defining the content of the request, response, or parameter.
    public var schema: SwaggerComponent<SwaggerSchema>?

    /// A map between a property name and its encoding information.
    /// The key, being the property name, must exist in the schema as a property.
    /// The encoding object shall only apply to request body
    /// when the media type is `multipart` or `application/x-www-form-urlencoded`.
    public var encoding: [String: SwaggerRequestBodyEncoding]?

    /// Examples of the media type.
    /// Each example object should match the media type and specified schema if present.
    /// The `examples` field is mutually exclusive of the `example` field.
    /// Furthermore, if referencing a `schema` which contains an example,
    /// the `examples` value shall override the example provided by the schema.
    public var examples: [String: SwaggerComponent<SwaggerExample>]?

    /// Example of the media type.
    /// The example object should be in the correct format as specified by the media type.
    /// The `example` field is mutually exclusive of the `examples` field.
    /// Furthermore, if referencing a `schema` which contains an example,
    /// the `example` value shall override the example provided by the schema.
    public var example: SwaggerEmbeddedExample?

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
        schema: SwaggerComponent<SwaggerSchema>? = nil,
        encoding: [String: SwaggerRequestBodyEncoding]? = nil,
        examples: [String: SwaggerComponent<SwaggerExample>]? = nil,
        example: SwaggerEmbeddedExample? = nil,
        extensions: [String: Any] = [:]
    ) {
        self.extensionsContainer = SwaggerExtensionsContainer(content: extensions)

        self.schema = schema
        self.encoding = encoding
        self.examples = examples
        self.example = example
    }

    /// Creates a new instance by decoding from the given decoder.
    ///
    /// This initializer throws an error if reading from the decoder fails, or
    /// if the data read is corrupted or otherwise invalid.
    ///
    /// - Parameter decoder: The decoder to read data from.
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        schema = try container.decodeIfPresent(forKey: .schema)
        encoding = try container.decodeIfPresent(forKey: .encoding)
        examples = try container.decodeIfPresent(forKey: .examples)
        example = try container.decodeIfPresent(forKey: .example)

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

        try container.encodeIfPresent(schema, forKey: .schema)
        try container.encodeIfPresent(encoding, forKey: .encoding)
        try container.encodeIfPresent(examples, forKey: .examples)
        try container.encodeIfPresent(example, forKey: .example)

        try extensionsContainer.encode(to: encoder)
    }
}
