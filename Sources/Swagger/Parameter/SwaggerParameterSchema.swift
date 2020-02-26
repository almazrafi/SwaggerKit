import Foundation

/// An object representing a schema that describes the structure and syntax of the parameter.
/// Get more info: https://swagger.io/specification/#parameterObject
public struct SwaggerParameterSchema: Codable, Equatable {

    // MARK: - Nested Types

    private enum CodingKeys: String, CodingKey {
        case schema
        case style
        case isExploded = "explode"
        case isAllowedReserved = "allowReserved"
        case examples
        case example
    }

    // MARK: - Instance Properties

    /// The schema defining the type used for the parameter.
    public var schema: SwaggerComponent<SwaggerSchema>

    /// Describes how the parameter value will be serialized depending on the type of the parameter value.
    /// Default values (based on parameter type):
    /// - for `query` - `form`
    /// - for `path` - `simple`
    /// - for `header` - `simple`
    /// - for `cookie` - `form`
    public var style: SwaggerParameterStyle?

    /// When this is `true`, parameter values of type `array` or `object` generate separate parameters
    /// for each value of the array or key-value pair of the map.
    /// For other types of parameters this property has no effect.
    /// Default value is `true` when style is `form`. For all other styles, the default value is `false`.
    public var isExploded: Bool?

    /// Determines whether the parameter value should allow reserved characters,
    /// as defined by [RFC 3986](https://tools.ietf.org/html/rfc3986#section-2.2)
    /// `:/?#[]@!$&'()*+,;=` to be included without percent-encoding.
    /// This property only applies to parameters of type `query`.
    /// Default value is `false`.
    public var isAllowedReserved: Bool?

    /// Examples of the media type.
    /// Each example object should match the media type and specified schema.
    /// The `examples` field is mutually exclusive of the `example` field.
    /// Furthermore, if referencing a `schema` which contains an example,
    /// the `examples` value shall override the example provided by the schema.
    public var examples: [String: SwaggerComponent<SwaggerExample>]?

    /// Example of the media type.
    /// The example should match the specified schema and encoding properties if present.
    /// The `example` field is mutually exclusive of the `examples` field.
    /// Furthermore, if referencing a `schema` which contains an example,
    /// the `example` value shall override the example provided by the schema.
    /// To represent examples of media types that cannot naturally be represented in JSON or YAML,
    /// a string value can contain the example with escaping where necessary.
    public var example: SwaggerEmbeddedExample?

    // MARK: - Initializers

    /// Creates a new instance with the provided values.
    public init(
        schema: SwaggerComponent<SwaggerSchema>,
        style: SwaggerParameterStyle? = nil,
        isExploded: Bool? = nil,
        isAllowedReserved: Bool? = nil,
        examples: [String: SwaggerComponent<SwaggerExample>]? = nil,
        example: SwaggerEmbeddedExample? = nil
    ) {
        self.schema = schema
        self.style = style
        self.isExploded = isExploded
        self.isAllowedReserved = isAllowedReserved
        self.examples = examples
        self.example = example
    }
}
