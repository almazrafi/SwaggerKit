import Foundation

/// An object representing a server.
/// Get more info: https://swagger.io/specification/#serverObject
public struct SpecServer: Codable, Equatable, Changeable {

    // MARK: - Nested Types

    private enum CodingKeys: String, CodingKey {
        case url
        case description
        case variables
    }

    // MARK: - Instance Properties

    private var extensionsContainer: SpecExtensionsContainer

    /// A URL to the target host. This URL supports Server Variables and may be relative,
    /// to indicate that the host location is relative to the location where the OpenAPI document is being served.
    /// Variable substitutions will be made when a variable is named in {brackets}.
    public var url: String

    /// Description of the host designated by the URL.
    /// [CommonMark syntax](http://spec.commonmark.org/) may be used for rich text representation.
    public var description: String?

    /// A map between a variable name and its value. The value is used for substitution in the server's URL template.
    public var variables: [String: SpecServerVariable]?

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
        url: String,
        description: String? = nil,
        variables: [String: SpecServerVariable]? = nil,
        extensions: [String: Any] = [:]
    ) {
        self.extensionsContainer = SpecExtensionsContainer(content: extensions)

        self.url = url
        self.description = description
        self.variables = variables
    }

    /// Creates a new instance by decoding from the given decoder.
    ///
    /// This initializer throws an error if reading from the decoder fails, or
    /// if the data read is corrupted or otherwise invalid.
    ///
    /// - Parameter decoder: The decoder to read data from.
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        url = try container.decode(forKey: .url)
        description = try container.decodeIfPresent(forKey: .description)
        variables = try container.decodeIfPresent(forKey: .variables)

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

        try container.encode(url, forKey: .url)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(variables, forKey: .variables)

        try extensionsContainer.encode(to: encoder)
    }
}
