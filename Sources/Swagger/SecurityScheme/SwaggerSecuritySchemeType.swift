import Foundation

/// An enumeration of security scheme types.
/// Get more info: https://swagger.io/specification/#securitySchemeObject
public enum SwaggerSecuritySchemeType: Equatable {

    // MARK: - Enumeration Cases

    /// API Key.
    /// - `name`: name of the header, query or cookie parameter to be used.
    /// - `in`: location of the API key.
    case apiKey(name: String, in: SwaggerSecurityAPIKeyLocation)

    /// OAuth 2.0.
    /// - `flows`: configuration of the supported OAuth Flows.
    case oauth2(flows: SwaggerOAuthFlows)

    /// Umbrella type for all HTTP security schemes, including Basic, Bearer and other.
    /// - `scheme`: HTTP Authorization scheme to be used in the `Authorization` header.
    case http(scheme: SwaggerSecurityHTTPScheme)

    /// [OpenID Connect Discovery](https://tools.ietf.org/html/draft-ietf-oauth-discovery-06)
    /// - `url`: OpenID Connect URL to discover OAuth2 configuration values.
    case openIDConnect(url: URL)
}
