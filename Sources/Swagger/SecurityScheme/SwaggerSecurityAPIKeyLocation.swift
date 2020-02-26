import Foundation

/// An enumeration of valid locations of the API key.
/// Get more info: https://swagger.io/specification/#securitySchemeObject
public enum SwaggerSecurityAPIKeyLocation: String, Codable {

    // MARK: - Enumeration Cases

    /// Query parameter.
    ///
    /// For example:
    /// ```
    /// GET /something?api_key=abcdef12345
    /// ```
    case query

    /// Custom header.
    ///
    /// For example:
    /// ```
    /// GET /something HTTP/1.1
    /// X-API-Key: abcdef12345
    /// ```
    case header

    /// Cookie.
    ///
    /// For example:
    /// ```
    /// GET /something HTTP/1.1
    /// Cookie: X-API-KEY=abcdef12345
    /// ```
    case cookie
}
