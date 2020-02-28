import Foundation

/// An object representing a configuration of the supported OAuth flows.
/// Get more info: https://swagger.io/specification/#oauthFlowsObject
public struct SpecOAuthFlows: Codable, Equatable {

    // MARK: - Nested Types

    private enum CodingKeys: String, CodingKey {
        case authorizationCode
        case implicit
        case clientCredentials
        case password
    }

    // MARK: - Instance Properties

    private var extensionsContainer: SpecExtensionsContainer

    /// The OAuth Authorization Code flow.
    /// The most common flow, mostly used for server-side and mobile web applications.
    public var authorizationCode: SpecOAuthAuthorizationCodeFlow?

    /// The OAuth Implicit flow.
    /// This flow requires the client to retrieve an access token directly.
    /// It is useful in cases when the user’s credentials cannot be stored in the client code
    /// because they can be easily accessed by the third party.
    /// It is suitable for web, desktop, and mobile applications that do not include any server component.
    public var implicit: SpecOAuthImplicitFlow?

    /// The OAuth Client Credentials flow.
    /// Intended for the server-to-server authentication, this flow describes an approach
    /// when the client application acts on its own behalf rather than on behalf of any individual user.
    /// In most scenarios, this flow provides the means to allow users specify their credentials
    /// in the client application, so it can access the resources under the client’s control.
    public var clientCredentials: SpecOAuthFlow?

    /// The OAuth Resource Owner Password flow.
    /// Requires logging in with a username and password.
    /// Since in that case the credentials will be a part of the request,
    /// this flow is suitable only for trusted clients
    /// (for example, official applications released by the API provider).
    public var password: SpecOAuthFlow?

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
        authorizationCode: SpecOAuthAuthorizationCodeFlow? = nil,
        implicit: SpecOAuthImplicitFlow? = nil,
        clientCredentials: SpecOAuthFlow? = nil,
        password: SpecOAuthFlow? = nil,
        extensions: [String: Any] = [:]
    ) {
        self.extensionsContainer = SpecExtensionsContainer(content: extensions)

        self.authorizationCode = authorizationCode
        self.implicit = implicit
        self.clientCredentials = clientCredentials
        self.password = password
    }

    /// Creates a new instance by decoding from the given decoder.
    ///
    /// This initializer throws an error if reading from the decoder fails, or
    /// if the data read is corrupted or otherwise invalid.
    ///
    /// - Parameter decoder: The decoder to read data from.
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        authorizationCode = try container.decodeIfPresent(forKey: .authorizationCode)
        implicit = try container.decodeIfPresent(forKey: .implicit)
        clientCredentials = try container.decodeIfPresent(forKey: .clientCredentials)
        password = try container.decodeIfPresent(forKey: .password)

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

        try container.encodeIfPresent(authorizationCode, forKey: .authorizationCode)
        try container.encodeIfPresent(implicit, forKey: .implicit)
        try container.encodeIfPresent(clientCredentials, forKey: .clientCredentials)
        try container.encodeIfPresent(password, forKey: .password)

        try extensionsContainer.encode(to: encoder)
    }
}
