import Foundation

/// An object representing a single API operation on a path.
/// Get more info: https://swagger.io/specification/#operationObject
public struct SwaggerOperation: Codable, Equatable {

    // MARK: - Nested Types

    private enum CodingKeys: String, CodingKey {
        case identifier = "operationId"
        case summary
        case description
        case externalDocumentation = "externalDocs"
        case isDeprecated = "deprecated"

        case responses
        case parameters
        case requestBody
        case callbacks
        case security
        case servers
        case tags
    }

    // MARK: - Instance Properties

    private var extensionsContainer: SwaggerExtensionsContainer

    /// Unique string used to identify the operation.
    /// The identifier must be unique among all operations described in the API. The identifier value is case-sensitive.
    /// It is recommended to follow common programming naming conventions.
    public var identifier: String?

    /// A short summary of what the operation does.
    public var summary: String?

    /// A verbose explanation of the operation behavior.
    /// [CommonMark syntax](http://spec.commonmark.org/) may be used for rich text representation.
    public var description: String?

    /// Additional external documentation for this schema.
    public var externalDocumentation: SwaggerExternalDocumentation?

    /// Specifies that the operation is deprecated and should be transitioned out of usage.
    /// Default value is `false`.
    public var isDeprecated: Bool?

    /// The list of possible responses as they are returned from executing this operation.
    public var responses: [String: SwaggerComponent<SwaggerResponse>]

    /// A list of parameters that are applicable for this operation.
    /// If a parameter is already defined at the path object,
    /// the new definition will override it but can never remove it.
    /// The list must not include duplicated parameters.
    /// A unique parameter is defined by a combination of a name and location.
    public var parameters: [SwaggerComponent<SwaggerParameter>]?

    /// The request body applicable for this operation.
    /// This property is only supported in HTTP methods
    /// where the HTTP 1.1 specification [RFC 7231](https://tools.ietf.org/html/rfc7231#section-4.3.1)
    /// has explicitly defined semantics for request bodies.
    /// In other cases where the HTTP spec is vague, requestBody shall be ignored.
    public var requestBody: SwaggerComponent<SwaggerRequestBody>?

    /// A map between an event name and its out-of band callbacks related to the parent operation.
    public var callbacks: [String: SwaggerComponent<SwaggerCallbacks>]?

    /// A declaration of which security mechanisms can be used for this operation.
    /// The list of values includes alternative security requirement objects that can be used.
    /// Only one of the security requirement objects need to be satisfied to authorize a request.
    /// This definition overrides any declared top-level security.
    /// To remove a top-level security declaration, an empty array can be used.
    public var security: [String: [String]]?

    /// An alternative server array to service this operation.
    /// If an alternative server object is specified at the path object or root level,
    /// it will be overridden by this value.
    public var servers: [SwaggerServer]?

    /// A list of tags for API documentation control.
    /// Tags can be used for logical grouping of operations by resources or any other qualifier.
    public var tags: [String]?

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
        identifier: String? = nil,
        summary: String? = nil,
        description: String? = nil,
        externalDocumentation: SwaggerExternalDocumentation? = nil,
        isDeprecated: Bool? = nil,
        responses: [String: SwaggerComponent<SwaggerResponse>],
        parameters: [SwaggerComponent<SwaggerParameter>]? = nil,
        requestBody: SwaggerComponent<SwaggerRequestBody>? = nil,
        callbacks: [String: SwaggerComponent<SwaggerCallbacks>]? = nil,
        security: [String: [String]]? = nil,
        servers: [SwaggerServer]? = nil,
        tags: [String]? = nil,
        extensions: [String: Any] = [:]
    ) {
        self.extensionsContainer = SwaggerExtensionsContainer(content: extensions)

        self.identifier = identifier
        self.summary = summary
        self.description = description
        self.externalDocumentation = externalDocumentation
        self.isDeprecated = isDeprecated

        self.responses = responses
        self.parameters = parameters
        self.requestBody = requestBody
        self.callbacks = callbacks
        self.security = security
        self.servers = servers
        self.tags = tags
    }

    /// Creates a new instance by decoding from the given decoder.
    ///
    /// This initializer throws an error if reading from the decoder fails, or
    /// if the data read is corrupted or otherwise invalid.
    ///
    /// - Parameter decoder: The decoder to read data from.
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        identifier = try container.decodeIfPresent(forKey: .identifier)
        summary = try container.decodeIfPresent(forKey: .summary)
        description = try container.decodeIfPresent(forKey: .description)
        externalDocumentation = try container.decodeIfPresent(forKey: .externalDocumentation)
        isDeprecated = try container.decodeIfPresent(forKey: .isDeprecated)

        responses = try container.decode(forKey: .responses)
        parameters = try container.decodeIfPresent(forKey: .parameters)
        requestBody = try container.decodeIfPresent(forKey: .requestBody)
        callbacks = try container.decodeIfPresent(forKey: .callbacks)

        security = try container
            .decodeIfPresent([[String: [String]]].self, forKey: .security)
            .map { security in
                Dictionary(security.compactMap { $0.first }) { $1 }
            }

        servers = try container.decodeIfPresent(forKey: .servers)
        tags = try container.decodeIfPresent(forKey: .tags)

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

        try container.encodeIfPresent(identifier, forKey: .identifier)
        try container.encodeIfPresent(summary, forKey: .summary)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(externalDocumentation, forKey: .externalDocumentation)
        try container.encodeIfPresent(isDeprecated, forKey: .isDeprecated)

        try container.encode(responses, forKey: .responses)
        try container.encodeIfPresent(parameters, forKey: .parameters)
        try container.encodeIfPresent(requestBody, forKey: .requestBody)
        try container.encodeIfPresent(callbacks, forKey: .callbacks)

        try container.encodeIfPresent(
            security?.map { [$0.key: $0.value] },
            forKey: .security
        )

        try container.encodeIfPresent(servers, forKey: .servers)
        try container.encodeIfPresent(tags, forKey: .tags)

        try extensionsContainer.encode(to: encoder)
    }
}
