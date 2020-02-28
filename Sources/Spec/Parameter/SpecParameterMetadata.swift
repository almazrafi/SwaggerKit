import Foundation

/// An object representing a metadata of the parameter.
/// Get more info: https://swagger.io/specification/#parameterObject
public struct SpecParameterMetadata: Codable, Equatable {

    // MARK: - Nested Types

    private enum CodingKeys: String, CodingKey {
        case type = "in"
        case name
        case description
        case isRequired = "required"
        case isDeprecated = "deprecated"
    }

    // MARK: - Instance Properties

    /// The type of the parameter.
    public var type: SpecParameterType

    /// The name of the parameter. Parameter names are case sensitive.
    public var name: String

    /// A brief description of the parameter. This could contain examples of use.
    /// [CommonMark syntax](http://spec.commonmark.org/) may be used for rich text representation.
    public var description: String?

    /// Determines whether this parameter is mandatory.
    /// If the parameter type is `path`, this property is required and its value must be true.
    /// Default value is `false`.
    public var isRequired: Bool?

    /// Specifies that a parameter is deprecated and should be transitioned out of usage.
    /// Default value is `false`.
    public var isDeprecated: Bool?

    // MARK: - Initializers

    /// Creates a new instance with the provided values.
    public init(
        type: SpecParameterType,
        name: String,
        description: String? = nil,
        isRequired: Bool? = nil,
        isDeprecated: Bool? = nil
    ) {
        self.type = type
        self.name = name
        self.description = description
        self.isRequired = isRequired
        self.isDeprecated = isDeprecated
    }
}
