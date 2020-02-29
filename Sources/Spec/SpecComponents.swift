import Foundation

/// Holds a set of reusable objects for different aspects of the specification.
/// All objects defined within the components object will have no effect on the API
/// unless they are explicitly referenced from properties outside the components object.
/// Get more info: https://swagger.io/specification/#componentsObject
public struct SpecComponents: Codable, Equatable, Changeable {

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

    private var extensionsContainer: SpecExtensionsContainer

    /// An object to hold reusable security scheme objects.
    /// The keys must match the regular expression: `^[a-zA-Z0-9\.\-_]+$`.
    public var securitySchemes: [String: SpecComponent<SpecSecurityScheme>]?

    /// An object to hold reusable schema objects.
    /// The keys must match the regular expression: `^[a-zA-Z0-9\.\-_]+$`.
    public var schemas: [String: SpecComponent<SpecSchema>]?

    /// An object to hold reusable header objects.
    /// The keys must match the regular expression: `^[a-zA-Z0-9\.\-_]+$`.
    public var headers: [String: SpecComponent<SpecHeader>]?

    /// An object to hold reusable parameter objects.
    /// The keys must match the regular expression: `^[a-zA-Z0-9\.\-_]+$`.
    public var parameters: [String: SpecComponent<SpecParameter>]?

    /// An object to hold reusable request body objects.
    /// The keys must match the regular expression: `^[a-zA-Z0-9\.\-_]+$`.
    public var requestBodies: [String: SpecComponent<SpecRequestBody>]?

    /// An object to hold reusable response objects.
    /// The keys must match the regular expression: `^[a-zA-Z0-9\.\-_]+$`.
    public var responses: [String: SpecComponent<SpecResponse>]?

    /// An object to hold reusable callbacks objects.
    /// The keys must match the regular expression: `^[a-zA-Z0-9\.\-_]+$`.
    public var callbacks: [String: SpecComponent<SpecCallbacks>]?

    /// An object to hold reusable example objects.
    /// The keys must match the regular expression: `^[a-zA-Z0-9\.\-_]+$`.
    public var examples: [String: SpecComponent<SpecExample>]?

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
        securitySchemes: [String: SpecComponent<SpecSecurityScheme>]? = nil,
        schemas: [String: SpecComponent<SpecSchema>]? = nil,
        headers: [String: SpecComponent<SpecHeader>]? = nil,
        parameters: [String: SpecComponent<SpecParameter>]? = nil,
        requestBodies: [String: SpecComponent<SpecRequestBody>]? = nil,
        responses: [String: SpecComponent<SpecResponse>]? = nil,
        callbacks: [String: SpecComponent<SpecCallbacks>]? = nil,
        examples: [String: SpecComponent<SpecExample>]? = nil,
        extensions: [String: Any] = [:]
    ) {
        self.extensionsContainer = SpecExtensionsContainer(content: extensions)

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

        extensionsContainer = try SpecExtensionsContainer(from: decoder)
    }

    // MARK: - Instance Methods

    private func referenceURI(typeKey: CodingKeys, key: String) -> String {
        return "#/components/\(typeKey.rawValue)/\(key)"
    }

    public func referenceURI(for securityScheme: SpecSecurityScheme) -> String? {
        return securitySchemes?
            .first { $1.value == securityScheme }
            .map { referenceURI(typeKey: CodingKeys.securitySchemes, key: $0.key) }
    }

    public func referenceURI(for schema: SpecSchema) -> String? {
        return schemas?
            .first { $1.value == schema }
            .map { referenceURI(typeKey: CodingKeys.schemas, key: $0.key) }
    }

    public func referenceURI(for header: SpecHeader) -> String? {
        return headers?
            .first { $1.value == header }
            .map { referenceURI(typeKey: CodingKeys.headers, key: $0.key) }
    }

    public func referenceURI(for parameter: SpecParameter) -> String? {
        return parameters?
            .first { $1.value == parameter }
            .map { referenceURI(typeKey: CodingKeys.parameters, key: $0.key) }
    }

    public func referenceURI(for requestBody: SpecRequestBody) -> String? {
        return requestBodies?
            .first { $1.value == requestBody }
            .map { referenceURI(typeKey: CodingKeys.requestBodies, key: $0.key) }
    }

    public func referenceURI(for response: SpecResponse) -> String? {
        return responses?
            .first { $1.value == response }
            .map { referenceURI(typeKey: CodingKeys.responses, key: $0.key) }
    }

    public func referenceURI(for callback: SpecCallbacks) -> String? {
        return callbacks?
            .first { $1.value == callback }
            .map { referenceURI(typeKey: CodingKeys.callbacks, key: $0.key) }
    }

    public func referenceURI(for example: SpecExample) -> String? {
        return examples?
            .first { $1.value == example }
            .map { referenceURI(typeKey: CodingKeys.examples, key: $0.key) }
    }

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
