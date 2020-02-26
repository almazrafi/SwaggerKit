import Foundation

/// An object representing a number schema type.
/// Get more info: https://swagger.io/specification/#schemaObject
public typealias SwaggerNumberSchema = SwaggerNumericSchema<Double>

extension SwaggerNumberSchema {

    // MARK: - Type Properties

    internal static let typeCodingValue = "number"

    // MARK: - Instance Properties

    /// The format of the number.
    public var format: SwaggerNumberFormat? {
        get { rawFormat.flatMap(SwaggerNumberFormat.init) }
        set { rawFormat = newValue?.rawValue }
    }

    // MARK: - Initializers

    /// Creates a new instance with the provided values.
    public init(
        format: SwaggerNumberFormat,
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
