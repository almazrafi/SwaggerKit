import Foundation

/// An enumeration of serialization types of the parameter.
/// Get more info: https://swagger.io/specification/#parameterObject
public enum SwaggerParameterSerialization: Equatable {

    // MARK: - Enumeration Cases

    /// Serialization with `schema` and `style` properties that describe the structure and syntax of the parameter.
    /// Used for simple scenarios.
    case schema(SwaggerParameterSchema)

    /// Serialization with `content` property that contains the representations for the parameter.
    /// The key is the media type and the value describes it. The map must only contain one entry.
    /// Used for more complex scenarios.
    case content([String: SwaggerMediaType])
}
