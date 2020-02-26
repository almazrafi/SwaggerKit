import Foundation

/// An object representing a security schema that can be used by the operations.
/// Supported schemes are HTTP authentication,
/// an API key (either as a header, a cookie parameter or as a query parameter),
/// OAuth2's common flows (implicit, password, application and access code)
/// and OpenID Connect Discovery.
/// Get more info: https://swagger.io/specification/#securitySchemeObject
public struct SwaggerSecurityScheme: Codable, Equatable {

    // MARK: - Nested Types

    private enum CodingKeys: String, CodingKey {
        case type
        case description

        case apiKeyName = "name"
        case apiKeyLocation = "in"

        case oauthFlows = "flows"

        case httpScheme = "scheme"
        case httpSchemeBearerFormat = "bearerFormat"

        case openIDConnectURL = "openIdConnectUrl"
    }

    private enum CodingType: String, Codable {
        case apiKey
        case oauth2
        case http
        case openIDConnect = "openIdConnect"
    }

    private enum CodingHTTPScheme: String, Codable {
        case basic
        case bearer
    }

    // MARK: - Instance Properties

    private var extensionsContainer: SwaggerExtensionsContainer

    /// The type of the security scheme.
    public var type: SwaggerSecuritySchemeType

    /// Explanation about the purpose of the data described by the schema.
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
        type: SwaggerSecuritySchemeType,
        description: String?,
        extensions: [String: Any] = [:]
    ) {
        self.extensionsContainer = SwaggerExtensionsContainer(content: extensions)

        self.type = type
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

        switch try container.decode(CodingType.self, forKey: .type) {
        case .apiKey:
            type = .apiKey(
                name: try container.decode(String.self, forKey: .apiKeyName),
                in: try container.decode(SwaggerSecurityAPIKeyLocation.self, forKey: .apiKeyLocation)
            )

        case .oauth2:
            type = .oauth2(flows: try container.decode(SwaggerOAuthFlows.self, forKey: .oauthFlows))

        case .http:
            let scheme: SwaggerSecurityHTTPScheme

            switch try container.decode(String.self, forKey: .httpScheme) {
            case CodingHTTPScheme.basic.rawValue:
                scheme = .basic

            case CodingHTTPScheme.bearer.rawValue:
                scheme = .bearer(format: try container.decodeIfPresent(String.self, forKey: .httpSchemeBearerFormat))

            case let otherScheme:
                scheme = .other(otherScheme)
            }

            type = .http(scheme: scheme)

        case .openIDConnect:
            type = .openIDConnect(url: try container.decode(URL.self, forKey: .openIDConnectURL))
        }

        description = try container.decodeIfPresent(String.self, forKey: .description)

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

        switch type {
        case let .apiKey(name: name, in: location):
            try container.encode(CodingType.apiKey, forKey: .type)
            try container.encode(name, forKey: .apiKeyName)
            try container.encode(location, forKey: .apiKeyLocation)

        case let .oauth2(flows: flows):
            try container.encode(CodingType.oauth2, forKey: .type)
            try container.encode(flows, forKey: .oauthFlows)

        case let .http(scheme: scheme):
            try container.encode(CodingType.http, forKey: .type)

            switch scheme {
            case .basic:
                try container.encode(CodingHTTPScheme.basic, forKey: .httpScheme)

            case let .bearer(format: format):
                try container.encode(CodingHTTPScheme.bearer, forKey: .httpScheme)
                try container.encode(format, forKey: .httpSchemeBearerFormat)

            case let .other(rawScheme):
                try container.encode(rawScheme, forKey: .httpScheme)
            }

        case let .openIDConnect(url: url):
            try container.encode(CodingType.openIDConnect, forKey: .type)
            try container.encode(url, forKey: .openIDConnectURL)
        }

        try container.encodeIfPresent(description, forKey: .description)

        try extensionsContainer.encode(to: encoder)
    }
}
