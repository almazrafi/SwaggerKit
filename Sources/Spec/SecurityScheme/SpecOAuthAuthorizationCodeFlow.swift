import Foundation

/// An object representing a configuration details for the OAuth Authorization Code flow.
/// Get more info: https://swagger.io/specification/#oauthFlowObject
public struct SpecOAuthAuthorizationCodeFlow: Codable, Equatable {

    // MARK: - Nested Types

    private enum CodingKeys: String, CodingKey {
        case authorizationURL = "authorizationUrl"
        case tokenURL = "tokenUrl"
        case refreshURL = "refreshUrl"
        case scopes
    }

    // MARK: - Instance Properties

    private var extensionsContainer: SpecExtensionsContainer

    /// The authorization URL to be used for this flow. Can be relative to the API server URL.
    public var authorizationURL: URL

    /// The token URL to be used for this flow. Can be relative to the API server URL.
    public var tokenURL: URL

    /// The URL to be used for obtaining refresh tokens. Can be relative to the API server URL.
    public var refreshURL: URL?

    /// The available scopes for the OAuth2 security scheme.
    /// A map between the scope name and a short description for it.
    public var scopes: [String: String]

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
        authorizationURL: URL,
        tokenURL: URL,
        refreshURL: URL? = nil,
        scopes: [String: String],
        extensions: [String: Any] = [:]
    ) {
        self.extensionsContainer = SpecExtensionsContainer(content: extensions)

        self.authorizationURL = authorizationURL
        self.tokenURL = tokenURL
        self.refreshURL = refreshURL
        self.scopes = scopes
    }

    /// Creates a new instance by decoding from the given decoder.
    ///
    /// This initializer throws an error if reading from the decoder fails, or
    /// if the data read is corrupted or otherwise invalid.
    ///
    /// - Parameter decoder: The decoder to read data from.
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        authorizationURL = try container.decode(forKey: .authorizationURL)
        tokenURL = try container.decode(forKey: .tokenURL)
        refreshURL = try container.decodeIfPresent(forKey: .refreshURL)
        scopes = try container.decode(forKey: .scopes)

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

        try container.encode(authorizationURL, forKey: .authorizationURL)
        try container.encode(tokenURL, forKey: .tokenURL)
        try container.encodeIfPresent(refreshURL, forKey: .refreshURL)
        try container.encode(scopes, forKey: .scopes)

        try extensionsContainer.encode(to: encoder)
    }
}
