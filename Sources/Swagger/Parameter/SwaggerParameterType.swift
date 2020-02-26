import Foundation

/// An enumeration of parameter types based on the parameter location.
/// Get more info: https://swagger.io/specification/#parameterObject
public enum SwaggerParameterType: String, Codable {

    // MARK: - Enumeration Cases

    /// Query parameters appear at the end of the request URL after a question mark (`?`),
    /// with different `name=value` pairs separated by ampersands (`&`).
    /// Query parameters can be required and optional.
    case query

    /// Custom headers are sent with an HTTP request.
    /// Note: Header parameters named Accept, Content-Type and Authorization are not allowed.
    case header

    /// Path parameters are variable parts of a URL path.
    /// They are typically used to point to a specific resource within a collection, such as a user identified by ID.
    /// A URL can have several path parameters, each denoted with curly braces { }.
    case path

    /// Cookie parameters are sent in the Cookie header, as `Cookie: name=value`.
    /// Multiple cookie parameters are sent in the same header, separated by a semicolon and space.
    case cookie
}
