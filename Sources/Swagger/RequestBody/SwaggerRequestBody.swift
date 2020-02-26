import Foundation

/// An object representing a request body.
/// Get more info: https://swagger.io/specification/#requestBodyObject
public struct SwaggerRequestBody: Codable, Equatable {

    // MARK: - Nested Types

    private enum CodingKeys: String, CodingKey {
        case content
        case description
        case isRequired = "required"
    }

    // MARK: - Instance Properties

    private var extensionsContainer: SwaggerExtensionsContainer

    /// The content of the request body.
    /// The key is a media type or [media type range](https://tools.ietf.org/html/rfc7231#appendix-D)
    /// and the value describes it. For requests that match multiple keys, only the most specific key is applicable,
    /// e.g. `text/plain` overrides `text/*`.
    public var content: [String: SwaggerRequestBodyMediaType]

    /// A brief description of the request body. This could contain examples of use.
    /// [CommonMark syntax](http://spec.commonmark.org/) may be used for rich text representation.
    public var description: String?

    /// Determines if the request body is required in the request.
    /// Default value is `false`.
    public var isRequired: Bool?

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
        content: [String: SwaggerRequestBodyMediaType],
        description: String? = nil,
        isRequired: Bool? = nil,
        extensions: [String: Any] = [:]
    ) {
        self.extensionsContainer = SwaggerExtensionsContainer(content: extensions)

        self.content = content
        self.description = description
        self.isRequired = isRequired
    }

    /// Creates a new instance by decoding from the given decoder.
    ///
    /// This initializer throws an error if reading from the decoder fails, or
    /// if the data read is corrupted or otherwise invalid.
    ///
    /// - Parameter decoder: The decoder to read data from.
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        content = try container.decode(forKey: .content)
        description = try container.decodeIfPresent(forKey: .description)
        isRequired = try container.decodeIfPresent(forKey: .isRequired)

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

        try container.encode(content, forKey: .content)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(isRequired, forKey: .isRequired)

        try extensionsContainer.encode(to: encoder)
    }
}
