import Foundation

/// An object representing a content of an example.
/// Get more info: https://swagger.io/specification/#exampleObject
public enum SwaggerExampleContent: Equatable {

    // MARK: - Enumeration Cases

    /// Embedded literal example.
    /// Example content is expected to be compatible with the type schema of its associated value.
    /// To represent examples of media types that cannot naturally represented in JSON or YAML,
    /// use a string value to contain the example, escaping where necessary.
    case embedded(SwaggerEmbeddedExample)

    /// A URL that points to the literal example.
    /// This provides the capability to reference examples that cannot easily be included in JSON or YAML documents.
    case external(URL)
}
