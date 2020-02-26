import Foundation

/// An object representing a bound of the possible values.
/// Get more info: https://swagger.io/specification/#schemaObject
public struct SwaggerSchemaValueBound<T: Comparable>: Equatable {

    // MARK: - Instance Properties

    /// A value of the bound.
    public var value: T

    /// Excludes the boundary value from the range of possible values.
    /// Default value is `false`.
    public var isExclusive: Bool?

    // MARK: - Initializers

    /// Creates a new instance with the provided values.
    public init(_ value: T, isExclusive: Bool? = nil) {
        self.value = value
        self.isExclusive = isExclusive
    }
}
