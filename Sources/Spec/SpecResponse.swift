import Foundation

/// An object representing a response.
/// Describes a single response from an API Operation, including design-time,
/// static links to operations based on the response.
/// Get more info: https://swagger.io/specification/#responseObject
public struct SpecResponse: Codable, Equatable {

    // MARK: - Nested Types

    private enum CodingKeys: String, CodingKey {
        case description
        case headers
        case content
        case links
    }

    // MARK: - Instance Properties

    private var codableRawLinks: AnyCodable?
    private var extensionsContainer: SpecExtensionsContainer

    /// A brief description of the
    /// [CommonMark syntax](http://spec.commonmark.org/) may be used for rich text representation.
    public var description: String

    /// Maps a header name to its definition.
    /// [RFC 7230](https://tools.ietf.org/html/rfc7230#page-22) states header names are case insensitive.
    /// If a response header is defined with the name "Content-Type", it shall be ignored.
    public var headers: [String: SpecComponent<SpecHeader>]?

    /// A map containing descriptions of potential response payloads.
    /// The key is a media type or [media type range](https://tools.ietf.org/html/rfc7231#appendix-D)
    /// and the value describes it. For responses that match multiple keys, only the most specific key is applicable.
    /// e.g. `text/plain` overrides `text/*`.
    public var content: [String: SpecMediaType]?

    // TODO: reimplement it with Link object
    /// A map of operations links that can be followed from the response.
    /// The key of the map is a short name for the link, following the naming constraints of component names.
    public var rawLinks: [String: Any]? {
        get { codableRawLinks?.value as? [String: Any] }
        set { codableRawLinks = newValue.map(AnyCodable.init) }
    }

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
        description: String,
        headers: [String: SpecComponent<SpecHeader>]? = nil,
        content: [String: SpecMediaType]? = nil,
        rawLinks: [String: Any]? = nil,
        extensions: [String: Any] = [:]
    ) {
        self.codableRawLinks = rawLinks.map(AnyCodable.init)
        self.extensionsContainer = SpecExtensionsContainer(content: extensions)

        self.description = description
        self.headers = headers
        self.content = content
    }

    /// Creates a new instance by decoding from the given decoder.
    ///
    /// This initializer throws an error if reading from the decoder fails, or
    /// if the data read is corrupted or otherwise invalid.
    ///
    /// - Parameter decoder: The decoder to read data from.
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        description = try container.decode(forKey: .description)
        headers = try container.decodeIfPresent(forKey: .headers)
        content = try container.decodeIfPresent(forKey: .content)

        let rawLinks = try container
            .decodeIfPresent([String: AnyCodable].self, forKey: .links)?
            .mapValues { $0.value }

        codableRawLinks = rawLinks.map(AnyCodable.init)
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

        try container.encode(description, forKey: .description)
        try container.encodeIfPresent(headers, forKey: .headers)
        try container.encodeIfPresent(content, forKey: .content)

        try container.encodeIfPresent(codableRawLinks, forKey: .links)
        try extensionsContainer.encode(to: encoder)
    }
}
