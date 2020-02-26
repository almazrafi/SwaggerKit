import Foundation

/// An object representing an example.
/// Get more info: https://swagger.io/specification/#exampleObject
public struct SwaggerExample: Codable, Equatable {

    // MARK: - Nested Types

    private enum CodingKeys: String, CodingKey {
        case embeddedContent = "value"
        case externalContent = "externalValue"

        case summary
        case description
    }

    // MARK: - Instance Properties

    private var extensionsContainer: SwaggerExtensionsContainer

    /// Сontent of the example.
    public var content: SwaggerExampleContent

    /// Short description for the example.
    public var summary: String?

    /// Long description for the example.
    /// [CommonMark syntax](http://spec.commonmark.org/) may be used for rich text representation.
    public var description: String?

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
        content: SwaggerExampleContent,
        summary: String? = nil,
        description: String? = nil,
        extensions: [String: Any] = [:]
    ) {
        self.extensionsContainer = SwaggerExtensionsContainer(content: extensions)

        self.content = content
        self.summary = summary
        self.description = description
    }

    /// Creates a new instance by decoding from the given decoder.
    ///
    /// This initializer throws an error if reading from the decoder fails, or
    /// if the data read is corrupted or otherwise invalid.
    ///
    /// - Parameter decoder: The decoder to read data from.
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        if container.contains(.embeddedContent) {
            content = .embedded(try container.decode(forKey: .embeddedContent))
        } else {
            content = .external(try container.decode(forKey: .externalContent))
        }

        summary = try container.decodeIfPresent(forKey: .summary)
        description = try container.decodeIfPresent(forKey: .description)

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

        switch content {
        case let .embedded(example):
            try container.encode(example, forKey: .embeddedContent)

        case let .external(url):
            try container.encode(url, forKey: .externalContent)
        }

        try container.encodeIfPresent(summary, forKey: .summary)
        try container.encodeIfPresent(description, forKey: .description)

        try extensionsContainer.encode(to: encoder)
    }
}
