import Foundation

/// Holds a set of reusable objects for different aspects of the specification.
/// All objects defined within the components object will have no effect on the API
/// unless they are explicitly referenced from properties outside the components object.
/// Get more info: https://swagger.io/specification/#componentsObject
public struct SwaggerComponents: Codable, Equatable {

    // MARK: - Nested Types

    private enum CodingKeys: String, CodingKey {
        case securitySchemes
        case schemas
        case headers
        case parameters
        case requestBodies
        case responses
        case callbacks
        case examples
    }

    // MARK: - Instance Properties

    private var extensionsContainer: SwaggerExtensionsContainer

    /// An object to hold reusable security scheme objects.
    /// The keys must match the regular expression: `^[a-zA-Z0-9\.\-_]+$`.
    public var securitySchemes: [String: SwaggerComponent<SwaggerSecurityScheme>]?

    /// An object to hold reusable schema objects.
    /// The keys must match the regular expression: `^[a-zA-Z0-9\.\-_]+$`.
    public var schemas: [String: SwaggerComponent<SwaggerSchema>]?

    /// An object to hold reusable header objects.
    /// The keys must match the regular expression: `^[a-zA-Z0-9\.\-_]+$`.
    public var headers: [String: SwaggerComponent<SwaggerHeader>]?

    /// An object to hold reusable parameter objects.
    /// The keys must match the regular expression: `^[a-zA-Z0-9\.\-_]+$`.
    public var parameters: [String: SwaggerComponent<SwaggerParameter>]?

    /// An object to hold reusable request body objects.
    /// The keys must match the regular expression: `^[a-zA-Z0-9\.\-_]+$`.
    public var requestBodies: [String: SwaggerComponent<SwaggerRequestBody>]?

    /// An object to hold reusable response objects.
    /// The keys must match the regular expression: `^[a-zA-Z0-9\.\-_]+$`.
    public var responses: [String: SwaggerComponent<SwaggerResponse>]?

    /// An object to hold reusable callbacks objects.
    /// The keys must match the regular expression: `^[a-zA-Z0-9\.\-_]+$`.
    public var callbacks: [String: SwaggerComponent<SwaggerCallbacks>]?

    /// An object to hold reusable example objects.
    /// The keys must match the regular expression: `^[a-zA-Z0-9\.\-_]+$`.
    public var examples: [String: SwaggerComponent<SwaggerExample>]?

    // TODO: add links

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
        securitySchemes: [String: SwaggerComponent<SwaggerSecurityScheme>]? = nil,
        schemas: [String: SwaggerComponent<SwaggerSchema>]? = nil,
        headers: [String: SwaggerComponent<SwaggerHeader>]? = nil,
        parameters: [String: SwaggerComponent<SwaggerParameter>]? = nil,
        requestBodies: [String: SwaggerComponent<SwaggerRequestBody>]? = nil,
        responses: [String: SwaggerComponent<SwaggerResponse>]? = nil,
        callbacks: [String: SwaggerComponent<SwaggerCallbacks>]? = nil,
        examples: [String: SwaggerComponent<SwaggerExample>]? = nil,
        extensions: [String: Any] = [:]
    ) {
        self.extensionsContainer = SwaggerExtensionsContainer(content: extensions)

        self.securitySchemes = securitySchemes
        self.schemas = schemas
        self.headers = headers
        self.parameters = parameters
        self.requestBodies = requestBodies
        self.responses = responses
        self.callbacks = callbacks
        self.examples = examples
    }

    /// Creates a new instance by decoding from the given decoder.
    ///
    /// This initializer throws an error if reading from the decoder fails, or
    /// if the data read is corrupted or otherwise invalid.
    ///
    /// - Parameter decoder: The decoder to read data from.
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        securitySchemes = try container.decodeIfPresent(forKey: .securitySchemes)
        schemas = try container.decodeIfPresent(forKey: .schemas)
        headers = try container.decodeIfPresent(forKey: .headers)
        parameters = try container.decodeIfPresent(forKey: .parameters)
        requestBodies = try container.decodeIfPresent(forKey: .requestBodies)
        responses = try container.decodeIfPresent(forKey: .responses)
        callbacks = try container.decodeIfPresent(forKey: .callbacks)
        examples = try container.decodeIfPresent(forKey: .examples)

        extensionsContainer = try SwaggerExtensionsContainer(from: decoder)
    }

    // MARK: - Instance Methods

    /// Encodes this instance into the given encoder.
    ///
    /// This function throws an error if any values are invalid for the given
    /// encoder's format.
    ///
    /// - Parameter encoder: The encoder to write data to.
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(securitySchemes, forKey: .securitySchemes)
        try container.encodeIfPresent(schemas, forKey: .schemas)
        try container.encodeIfPresent(headers, forKey: .headers)
        try container.encodeIfPresent(parameters, forKey: .parameters)
        try container.encodeIfPresent(requestBodies, forKey: .requestBodies)
        try container.encodeIfPresent(responses, forKey: .responses)
        try container.encodeIfPresent(callbacks, forKey: .callbacks)
        try container.encodeIfPresent(examples, forKey: .examples)

        try extensionsContainer.encode(to: encoder)
    }
}
