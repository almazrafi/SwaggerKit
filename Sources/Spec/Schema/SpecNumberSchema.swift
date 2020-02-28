import Foundation

/// An object representing a number schema type.
/// Get more info: https://swagger.io/specification/#schemaObject
public typealias SpecNumberSchema = SpecNumericSchema<Double>

extension SpecNumberSchema {

    // MARK: - Type Properties

    internal static let typeCodingValue = "number"

    // MARK: - Instance Properties

    /// The format of the number.
    public var format: SpecNumberFormat? {
        get { rawFormat.flatMap(SpecNumberFormat.init) }
        set { rawFormat = newValue?.rawValue }
    }

    // MARK: - Initializers

    /// Creates a new instance with the provided values.
    public init(
        format: SpecNumberFormat,
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
