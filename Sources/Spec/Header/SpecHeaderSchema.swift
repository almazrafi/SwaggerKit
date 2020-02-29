import Foundation

/// An object representing a schema that describes the structure and syntax of the header.
/// Get more info: https://swagger.io/specification/#headerObject
public struct SpecHeaderSchema: Codable, Equatable, Changeable {

    // MARK: - Nested Types

    private enum CodingKeys: String, CodingKey {
        case schema
        case isExploded = "explode"
        case examples
        case example
    }

    // MARK: - Instance Properties

    /// The schema defining the type used for the header.
    public var schema: SpecComponent<SpecSchema>

    /// When this is `true`, header values of type `array` or `object` generate separate parameters
    /// for each value of the array or key-value pair of the map.
    /// For other types of headers this property has no effect.
    /// Default value is `false`.
    public var isExploded: Bool?

    /// Examples of the media type.
    /// Each example object should match the media type and specified schema.
    /// The `examples` field is mutually exclusive of the `example` field.
    /// Furthermore, if referencing a `schema` which contains an example,
    /// the `examples` value shall override the example provided by the schema.
    public var examples: [String: SpecComponent<SpecExample>]?

    /// Example of the media type.
    /// The example should match the specified schema and encoding properties if present.
    /// The `example` field is mutually exclusive of the `examples` field.
    /// Furthermore, if referencing a `schema` which contains an example,
    /// the `example` value shall override the example provided by the schema.
    /// To represent examples of media types that cannot naturally be represented in JSON or YAML,
    /// a string value can contain the example with escaping where necessary.
    public var example: SpecEmbeddedExample?

    // MARK: - Initializers

    /// Creates a new instance with the provided values.
    public init(
        schema: SpecComponent<SpecSchema>,
        isExploded: Bool? = nil,
        examples: [String: SpecComponent<SpecExample>]? = nil,
        example: SpecEmbeddedExample? = nil
    ) {
        self.schema = schema
        self.isExploded = isExploded
        self.examples = examples
        self.example = example
    }
}
