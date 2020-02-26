import Foundation

/// An enumeration of styles for common ways of serializing request body properties.
/// Get more info: https://swagger.io/specification/#encodingObject
public enum SwaggerRequestBodyEncodingStyle: String, Codable {

    // MARK: - Enumeration Cases

    /// Form style parameters defined by [RFC 6570](https://tools.ietf.org/html/rfc6570#section-3.2.8).
    /// Schema type: primitive, `array`, `object`.
    case form

    /// Space separated array values.
    /// Schema type: `array`.
    case spaceDelimited

    /// Pipe separated array values.
    /// Schema type: `array`.
    case pipeDelimited

    /// Provides a simple way of rendering nested objects using form parameters.
    /// Schema type: `object`.
    case deepObject
}
