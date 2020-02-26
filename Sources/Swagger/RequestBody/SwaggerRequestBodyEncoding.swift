import Foundation

/// An object representing an encoding applied to a single schema property of request body.
/// Get more info: https://swagger.io/specification/#encodingObject
public struct SwaggerRequestBodyEncoding: Codable, Equatable {

    // MARK: - Nested Types

    private enum CodingKeys: String, CodingKey {
        case contentType
        case headers
        case style
        case isExploded = "explode"
        case isAllowedReserved = "allowReserved"
    }

    // MARK: - Instance Properties

    private var extensionsContainer: SwaggerExtensionsContainer

    /// The Content-Type for encoding a specific property.
    /// The value can be a specific media type (e.g. `application/json`), a wildcard media type (e.g. `image/*`),
    /// or a comma-separated list of the two types.
    /// Default value depends on the property type:
    /// - for `string` with `format` being `binary` – `application/octet-stream`
    /// - for other primitive types – `text/plain`
    /// - for `object` - `application/json`
    /// - for `array` – the default is defined based on the inner type
    public var contentType: String?

    /// A map allowing additional information to be provided as headers, for example `Content-Disposition`.
    /// `Content-Type` is described separately and shall be ignored in this section.
    /// This property shall be ignored if the request body media type is not a `multipart`.
    public var headers: [String: SwaggerComponent<SwaggerHeader>]?

    /// Describes how a specific property value will be serialized depending on its type.
    /// This property shall be ignored if the request body media type is not `application/x-www-form-urlencoded`.
    /// Default values is `form`.
    public var style: SwaggerRequestBodyEncodingStyle?

    /// When this is `true`, property values of type `array` or `object` generate separate parameters
    /// for each value of the array, or key-value-pair of the map.
    /// For other types of properties this property has no effect.
    /// This property shall be ignored if the request body media type is not `application/x-www-form-urlencoded`.
    /// When style is `form`, the default value is `true`. For all other styles, the default value is `false`.
    public var isExploded: Bool?

    /// Determines whether the parameter value SHOULD allow reserved characters,
    /// as defined by [RFC 3986](https://tools.ietf.org/html/rfc3986#section-2.2)
    /// `:/?#[]@!$&'()*+,;=` to be included without percent-encoding.
    /// This property shall be ignored if the request body media type is not `application/x-www-form-urlencoded`.
    /// The default value is `false`.
    public var isAllowedReserved: Bool?

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
        contentType: String? = nil,
        headers: [String: SwaggerComponent<SwaggerHeader>]? = nil,
        style: SwaggerRequestBodyEncodingStyle? = nil,
        isExploded: Bool? = nil,
        isAllowedReserved: Bool? = nil,
        extensions: [String: Any] = [:]
    ) {
        self.extensionsContainer = SwaggerExtensionsContainer(content: extensions)

        self.contentType = contentType
        self.headers = headers
        self.style = style
        self.isExploded = isExploded
        self.isAllowedReserved = isAllowedReserved
    }

    /// Creates a new instance by decoding from the given decoder.
    ///
    /// This initializer throws an error if reading from the decoder fails, or
    /// if the data read is corrupted or otherwise invalid.
    ///
    /// - Parameter decoder: The decoder to read data from.
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        contentType = try container.decodeIfPresent(forKey: .contentType)
        headers = try container.decodeIfPresent(forKey: .headers)
        style = try container.decodeIfPresent(forKey: .style)
        isExploded = try container.decodeIfPresent(forKey: .isExploded)
        isAllowedReserved = try container.decodeIfPresent(forKey: .isAllowedReserved)

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

        try container.encodeIfPresent(contentType, forKey: .contentType)
        try container.encodeIfPresent(headers, forKey: .headers)
        try container.encodeIfPresent(style, forKey: .style)
        try container.encodeIfPresent(isExploded, forKey: .isExploded)
        try container.encodeIfPresent(isAllowedReserved, forKey: .isAllowedReserved)

        try extensionsContainer.encode(to: encoder)
    }
}
