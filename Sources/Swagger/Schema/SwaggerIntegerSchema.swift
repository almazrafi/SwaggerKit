import Foundation

/// An object representing an integer schema type.
/// Get more info: https://swagger.io/specification/#schemaObject
public typealias SwaggerIntegerSchema = SwaggerNumericSchema<Int64>

extension SwaggerIntegerSchema {

    // MARK: - Type Properties

    internal static let typeCodingValue = "integer"

    // MARK: - Instance Properties

    /// The format of the integer.
    public var format: SwaggerIntegerFormat? {
        get { rawFormat.flatMap(SwaggerIntegerFormat.init) }
        set { rawFormat = newValue?.rawValue }
    }

    // MARK: - Initializers

    /// Creates a new instance with the provided values.
    public init(
        format: SwaggerIntegerFormat,
        multipleOf: T? = nil,
        defaultValue: T? = nil,
        enumeration: [T]? = nil,
        minimum: SwaggerSchemaValueBound<T>? = nil,
        maximum: SwaggerSchemaValueBound<T>? = nil
    ) {
        self.init(
            rawFormat: format.rawValue,
            multipleOf: multipleOf,
            defaultValue: defaultValue,
            enumeration: enumeration,
            minimum: minimum,
            maximum: maximum
        )
    }
}
