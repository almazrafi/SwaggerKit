import Foundation

/// An object representing a header that follows the structure of the Parameter object with the following changes:
/// - `name` must not be specified, it is given in the corresponding headers map.
/// - `type` must not be specified, it is implicitly header.
/// - all traits that are affected by the `type` must be applicable to the header type (for example, `style`).
/// Get more info: https://swagger.io/specification/#headerObject
public struct SpecHeader: Codable, Equatable, Changeable {

    // MARK: - Nested Types

    private enum CodingKeys: String, CodingKey {
        case content
    }

    // MARK: - Instance Properties

    private var extensionsContainer: SpecExtensionsContainer

    /// Serialization type of the header.
    public var serialization: SpecHeaderSerialization

    /// Metadata to describe the header.
    public var metadata: SpecHeaderMetadata

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
        serialization: SpecHeaderSerialization,
        metadata: SpecHeaderMetadata,
        extensions: [String: Any] = [:]
    ) {
        self.extensionsContainer = SpecExtensionsContainer(content: extensions)

        self.serialization = serialization
        self.metadata = metadata
    }

    /// Creates a new instance by decoding from the given decoder.
    ///
    /// This initializer throws an error if reading from the decoder fails, or
    /// if the data read is corrupted or otherwise invalid.
    ///
    /// - Parameter decoder: The decoder to read data from.
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        if container.contains(.content) {
            serialization = .content(try container.decode(forKey: .content))
        } else {
            serialization = .schema(try SpecHeaderSchema(from: decoder))
        }

        metadata = try SpecHeaderMetadata(from: decoder)
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

        switch serialization {
        case let .content(content):
            try container.encode(content, forKey: .content)

        case let .schema(schema):
            try schema.encode(to: encoder)
        }

        try metadata.encode(to: encoder)
        try extensionsContainer.encode(to: encoder)
    }
}
