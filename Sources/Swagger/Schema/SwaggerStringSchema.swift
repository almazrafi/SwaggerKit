import Foundation

/// An object representing a string schema type.
/// Get more info: https://swagger.io/specification/#schemaObject
public struct SwaggerStringSchema: Codable, Equatable {

    // MARK: - Nested Types

    private enum CodingKeys: String, CodingKey {
        case rawFormat = "format"

        case defaultValue = "default"
        case enumeration = "enum"

        case minLength
        case maxLength
        case pattern
    }

    // MARK: - Type Properties

    internal static let typeCodingValue = "string"

    // MARK: - Instance Properties

    /// The raw value of the string format.
    public var rawFormat: String?

    /// Default value
    public var defaultValue: String?

    /// An enumeration of possible values.
    public var enumeration: [String]?

    /// The regular expression template for the string value.
    public var pattern: String?

    /// The minimum length of the string.
    public var minLength: Int?

    /// The maximum length of the string.
    public var maxLength: Int?

    /// The format of the string.
    public var format: SwaggerStringFormat? {
        get { rawFormat.flatMap(SwaggerStringFormat.init) }
        set { rawFormat = newValue?.rawValue }
    }

    // MARK: - Initializers

    /// Creates a new instance with the provided values.
    public init(
        rawFormat: String? = nil,
        defaultValue: String? = nil,
        enumeration: [String]? = nil,
        minLength: Int? = nil,
        maxLength: Int? = nil,
        pattern: String? = nil
    ) {
        self.rawFormat = rawFormat

        self.defaultValue = defaultValue
        self.enumeration = enumeration

        self.pattern = pattern
        self.minLength = minLength
        self.maxLength = maxLength
    }

    /// Creates a new instance with the provided values.
    public init(
        format: SwaggerStringFormat?,
        defaultValue: String? = nil,
        enumeration: [String]? = nil,
        pattern: String? = nil,
        minLength: Int? = nil,
        maxLength: Int? = nil
    ) {
        self.init(
            rawFormat: format?.rawValue,
            defaultValue: defaultValue,
            enumeration: enumeration,
            minLength: minLength,
            maxLength: maxLength,
            pattern: pattern
        )
    }
}
