import Foundation

/// An object representing an integer schema type.
/// Get more info: https://swagger.io/specification/#schemaObject
public typealias SpecIntegerSchema = SpecNumericSchema<Int64>

extension SpecIntegerSchema {

    // MARK: - Type Properties

    internal static let typeCodingValue = "integer"

    // MARK: - Instance Properties

    /// The format of the integer.
    public var format: SpecIntegerFormat? {
        get { rawFormat.flatMap(SpecIntegerFormat.init) }
        set { rawFormat = newValue?.rawValue }
    }

    // MARK: - Initializers

    /// Creates a new instance with the provided values.
    public init(
        format: SpecIntegerFormat,
        multipleOf: T? = nil,
        defaultValue: T? = nil,
        enumeration: [T]? = nil,
        minimum: SpecSchemaValueBound<T>? = nil,
        maximum: SpecSchemaValueBound<T>? = nil
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
