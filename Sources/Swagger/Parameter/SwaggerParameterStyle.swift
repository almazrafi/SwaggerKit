import Foundation

/// An enumeration of styles for common ways of serializing simple parameters.
/// Get more info: https://swagger.io/specification/#parameterObject
public enum SwaggerParameterStyle: String, Codable {

    // MARK: - Enumeration Cases

    /// Simple style parameters defined by [RFC 6570](https://tools.ietf.org/html/rfc6570#section-3.2.2).
    /// Schema type: `array`. Parameter type: `path`, `header`.
    case simple

    /// Label style parameters defined by [RFC 6570](https://tools.ietf.org/html/rfc6570#section-3.2.5).
    /// Schema type: primitive, `array`, `object`. Parameter type: `path`.
    case label

    /// Path-style parameters defined by [RFC 6570](https://tools.ietf.org/html/rfc6570#section-3.2.7).
    /// Schema type: primitive, `array`, `object`. Parameter type: `path`.
    case matrix

    /// Form style parameters defined by [RFC 6570](https://tools.ietf.org/html/rfc6570#section-3.2.8).
    /// Schema type: primitive, `array`, `object`. Parameter type: `query`, `cookie`.
    case form

    /// Space separated array values.
    /// Schema type: `array`. Parameter type: `query`.
    case spaceDelimited

    /// Pipe separated array values.
    /// Schema type: `array`. Parameter type: `query`.
    case pipeDelimited

    /// Provides a simple way of rendering nested objects using form parameters.
    /// Schema type: `object`. Parameter type: `query`.
    case deepObject
}
