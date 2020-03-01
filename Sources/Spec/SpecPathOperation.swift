import Foundation

/// An object representing a single API operation on a path.
/// Get more info: https://swagger.io/specification/#operationObject
public struct SpecPathOperation: Codable, Equatable, Changeable {

    // MARK: - Nested Types

    private enum CodingKeys: String, CodingKey {
        case identifier = "operationId"
        case summary
        case description
        case externalDocs
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

    private var extensionsContainer: SpecExtensionsContainer

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
    public var externalDocs: SpecExternalDocs?

    /// Specifies that the operation is deprecated and should be transitioned out of usage.
    /// Default value is `false`.
    public var isDeprecated: Bool?

    /// The list of possible responses as they are returned from executing this operation.
    public var responses: [String: SpecComponent<SpecResponse>]

    /// A list of parameters that are applicable for this operation.
    /// If a parameter is already defined at the path object,
    /// the new definition will override it but can never remove it.
    /// The list must not include duplicated parameters.
    /// A unique parameter is defined by a combination of a name and location.
    public var parameters: [SpecComponent<SpecParameter>]?

    /// The request body applicable for this operation.
    /// This property is only supported in HTTP methods
    /// where the HTTP 1.1 specification [RFC 7231](https://tools.ietf.org/html/rfc7231#section-4.3.1)
    /// has explicitly defined semantics for request bodies.
    /// In other cases where the HTTP spec is vague, requestBody shall be ignored.
    public var requestBody: SpecComponent<SpecRequestBody>?

    /// A map between an event name and its out-of band callbacks related to the parent operation.
    public var callbacks: [String: SpecComponent<SpecCallbacks>]?

    /// A list of tags for API documentation control.
    /// Tags can be used for logical grouping of operations by resources or any other qualifier.
    public var tags: [String]?

    /// An alternative server array to service this operation.
    /// If an alternative server object is specified at the path object or root level,
    /// it will be overridden by this value.
    public var servers: [SpecServer]?

    /// A declaration of which security mechanisms can be used for this operation.
    /// The list of values includes alternative security requirement objects that can be used.
    /// Only one of the security requirement objects need to be satisfied to authorize a request.
    /// This definition overrides any declared top-level security.
    /// To remove a top-level security declaration, an empty array can be used.
    public var security: [SpecSecurityRequirement]?

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
        externalDocs: SpecExternalDocs? = nil,
        isDeprecated: Bool? = nil,
        responses: [String: SpecComponent<SpecResponse>],
        parameters: [SpecComponent<SpecParameter>]? = nil,
        requestBody: SpecComponent<SpecRequestBody>? = nil,
        callbacks: [String: SpecComponent<SpecCallbacks>]? = nil,
        tags: [String]? = nil,
        servers: [SpecServer]? = nil,
        security: [SpecSecurityRequirement]? = nil,
        extensions: [String: Any] = [:]
    ) {
        self.extensionsContainer = SpecExtensionsContainer(content: extensions)

        self.identifier = identifier
        self.summary = summary
        self.description = description
        self.externalDocs = externalDocs
        self.isDeprecated = isDeprecated

        self.responses = responses
        self.parameters = parameters
        self.requestBody = requestBody
        self.callbacks = callbacks
        self.tags = tags
        self.servers = servers
        self.security = security
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
        externalDocs = try container.decodeIfPresent(forKey: .externalDocs)
        isDeprecated = try container.decodeIfPresent(forKey: .isDeprecated)

        responses = try container.decode(forKey: .responses)
        parameters = try container.decodeIfPresent(forKey: .parameters)
        requestBody = try container.decodeIfPresent(forKey: .requestBody)
        callbacks = try container.decodeIfPresent(forKey: .callbacks)
        tags = try container.decodeIfPresent(forKey: .tags)
        servers = try container.decodeIfPresent(forKey: .servers)
        security = try container.decodeIfPresent(forKey: .security)

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

        try container.encodeIfPresent(identifier, forKey: .identifier)
        try container.encodeIfPresent(summary, forKey: .summary)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(externalDocs, forKey: .externalDocs)
        try container.encodeIfPresent(isDeprecated, forKey: .isDeprecated)

        try container.encode(responses, forKey: .responses)
        try container.encodeIfPresent(parameters, forKey: .parameters)
        try container.encodeIfPresent(requestBody, forKey: .requestBody)
        try container.encodeIfPresent(callbacks, forKey: .callbacks)
        try container.encodeIfPresent(tags, forKey: .tags)
        try container.encodeIfPresent(servers, forKey: .servers)
        try container.encodeIfPresent(security, forKey: .security)

        try extensionsContainer.encode(to: encoder)
    }
}
