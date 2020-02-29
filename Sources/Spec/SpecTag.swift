import Foundation

/// Adds metadata to a single tag that is used by the SpecOperation.
/// It is not mandatory to have a SpecTag per tag defined in the SpecOperation instances.
/// Get more info: https://swagger.io/specification/#tagObject
public struct SpecTag: Codable, Equatable, Changeable {

    // MARK: - Nested Types

    private enum CodingKeys: String, CodingKey {
        case name
        case description
        case externalDocumentation = "externalDocs"
    }

    // MARK: - Instance Properties

    private var extensionsContainer: SpecExtensionsContainer

    /// The name of the tag.
    public var name: String

    /// Description of the target documentation.
    /// [CommonMark syntax](http://spec.commonmark.org/) may be used for rich text representation.
    public var description: String?

    /// Additional external documentation for this tag.
    public var externalDocumentation: SpecExternalDocumentation?

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
        name: String,
        description: String? = nil,
        externalDocumentation: SpecExternalDocumentation? = nil,
        extensions: [String: Any] = [:]
    ) {
        self.extensionsContainer = SpecExtensionsContainer(content: extensions)

        self.name = name
        self.description = description
        self.externalDocumentation = externalDocumentation
    }

    /// Creates a new instance by decoding from the given decoder.
    ///
    /// This initializer throws an error if reading from the decoder fails, or
    /// if the data read is corrupted or otherwise invalid.
    ///
    /// - Parameter decoder: The decoder to read data from.
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        name = try container.decode(forKey: .name)
        description = try container.decodeIfPresent(forKey: .description)
        externalDocumentation = try container.decodeIfPresent(forKey: .externalDocumentation)

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

        try container.encode(name, forKey: .name)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(externalDocumentation, forKey: .externalDocumentation)

        try extensionsContainer.encode(to: encoder)
    }
}
