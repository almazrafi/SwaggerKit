import Foundation

/// An object representing a callbacks object.
/// Get more info: https://swagger.io/specification/#callbackObject
public struct SpecCallbacks: Codable, Equatable {

    // MARK: - Instance Properties

    private var extensionsContainer: SpecExtensionsContainer

    /// A map of possible out-of band callbacks related to the parent operation.
    /// Each value in the map is a path object that describes a set of requests
    /// that may be initiated by the API provider and the expected responses.
    /// The key value used to identify the callback object is an expression,
    /// evaluated at runtime, that identifies a URL to use for the callback operation.
    public var paths: [String: SpecPath]

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
        paths: [String: SpecPath],
        extensions: [String: Any] = [:]
    ) {
        self.extensionsContainer = SpecExtensionsContainer(content: extensions)
        self.paths = paths
    }

    /// Creates a new instance by decoding from the given decoder.
    ///
    /// This initializer throws an error if reading from the decoder fails, or
    /// if the data read is corrupted or otherwise invalid.
    ///
    /// - Parameter decoder: The decoder to read data from.
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)

        paths = [:]
        extensionsContainer = try SpecExtensionsContainer(from: decoder)

        try container.allKeys
            .filter { !extensionsContainer.contains(codingKey: $0.stringValue) }
            .forEach { paths[$0.stringValue] = try container.decode(forKey: $0) }
    }

    // MARK: - Instance Methods

    /// Encodes this instance into the given encoder.
    ///
    /// This function throws an error if any values are invalid for the given encoder's format.
    ///
    /// - Parameter encoder: The encoder to write data to.
    public func encode(to encoder: Encoder) throws {
        try paths.encode(to: encoder)
        try extensionsContainer.encode(to: encoder)
    }
}
