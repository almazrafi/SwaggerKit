import Foundation

/// An object representing the operations available on a single path.
/// A path object may be empty, due to [ACL constraints](https://swagger.io/specification/#securityFiltering).
/// The path itself is still exposed to the documentation viewer
/// but they will not know which operations and parameters are available.
/// Get more info: https://swagger.io/specification/#pathItemObject
public struct SpecPath: Codable, Equatable, Changeable {

    // MARK: - Nested Types

    private enum CodingKeys: String, CodingKey {
        case summary
        case description

        case servers
        case parameters

        case get
        case post
        case put
        case patch
        case delete
        case head
        case options
        case trace
    }

    // MARK: - Instance Properties

    private var extensionsContainer: SpecExtensionsContainer

    /// A short summary, intended to apply to all operations in this path.
    public var summary: String?

    /// A verbose explanation, intended to apply to all operations in this path.
    /// [CommonMark syntax](http://spec.commonmark.org/) may be used for rich text representation.
    public var description: String?

    /// An alternative server array to service all operations in this path.
    /// If an alternative server object is specified at the root level,
    /// it will be overridden by this value.
    public var servers: [SpecServer]?

    /// A list of parameters that are applicable for all the operations described under this path.
    /// These parameters can be overridden at the operation level, but cannot be removed there.
    /// The list must not include duplicated parameters.
    /// A unique parameter is defined by a combination of a name and type.
    public var parameters: [SpecComponent<SpecParameter>]?

    /// A definition of a `GET` operation on this path.
    public var get: SpecPathOperation?

    /// A definition of a `POST` operation on this path.
    public var post: SpecPathOperation?

    /// A definition of a `PUT` operation on this path.
    public var put: SpecPathOperation?

    /// A definition of a `PATCH` operation on this path.
    public var patch: SpecPathOperation?

    /// A definition of a `DELETE` operation on this path.
    public var delete: SpecPathOperation?

    /// A definition of a `HEAD` operation on this path.
    public var head: SpecPathOperation?

    /// A definition of a `OPTIONS` operation on this path.
    public var options: SpecPathOperation?

    /// A definition of a `TRACE` operation on this path.
    public var trace: SpecPathOperation?

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
        summary: String? = nil,
        description: String? = nil,
        servers: [SpecServer]? = nil,
        parameters: [SpecComponent<SpecParameter>]? = nil,
        get: SpecPathOperation? = nil,
        post: SpecPathOperation? = nil,
        put: SpecPathOperation? = nil,
        patch: SpecPathOperation? = nil,
        delete: SpecPathOperation? = nil,
        head: SpecPathOperation? = nil,
        options: SpecPathOperation? = nil,
        trace: SpecPathOperation? = nil,
        extensions: [String: Any] = [:]
    ) {
        self.extensionsContainer = SpecExtensionsContainer(content: extensions)

        self.summary = summary
        self.description = description

        self.servers = servers
        self.parameters = parameters

        self.get = get
        self.post = post
        self.put = put
        self.patch = patch
        self.delete = delete
        self.head = head
        self.options = options
        self.trace = trace
    }

    /// Creates a new instance by decoding from the given decoder.
    ///
    /// This initializer throws an error if reading from the decoder fails, or
    /// if the data read is corrupted or otherwise invalid.
    ///
    /// - Parameter decoder: The decoder to read data from.
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        summary = try container.decodeIfPresent(forKey: .summary)
        description = try container.decodeIfPresent(forKey: .description)

        servers = try container.decodeIfPresent(forKey: .servers)
        parameters = try container.decodeIfPresent(forKey: .parameters)

        get = try container.decodeIfPresent(forKey: .get)
        post = try container.decodeIfPresent(forKey: .post)
        put = try container.decodeIfPresent(forKey: .put)
        patch = try container.decodeIfPresent(forKey: .patch)
        delete = try container.decodeIfPresent(forKey: .delete)
        head = try container.decodeIfPresent(forKey: .head)
        options = try container.decodeIfPresent(forKey: .options)
        trace = try container.decodeIfPresent(forKey: .trace)

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

        try container.encodeIfPresent(summary, forKey: .summary)
        try container.encodeIfPresent(description, forKey: .description)

        try container.encodeIfPresent(servers, forKey: .servers)
        try container.encodeIfPresent(parameters, forKey: .parameters)

        try container.encodeIfPresent(get, forKey: .get)
        try container.encodeIfPresent(post, forKey: .post)
        try container.encodeIfPresent(put, forKey: .put)
        try container.encodeIfPresent(patch, forKey: .patch)
        try container.encodeIfPresent(delete, forKey: .delete)
        try container.encodeIfPresent(head, forKey: .head)
        try container.encodeIfPresent(options, forKey: .options)
        try container.encodeIfPresent(trace, forKey: .trace)

        try extensionsContainer.encode(to: encoder)
    }
}
