import Foundation

/// An object representing a numeric schema type.
/// Get more info: https://swagger.io/specification/#schemaObject
public struct SpecNumericSchema<T: Codable & Comparable>: Codable, Equatable, Changeable {

    // MARK: - Nested Types

    private enum CodingKeys: String, CodingKey {
        case rawFormat = "format"

        case multipleOf
        case defaultValue = "default"
        case enumeration = "enum"

        case minimumValue = "minimum"
        case isMinimumExclusive = "exclusiveMinimum"

        case maximumValue = "maximum"
        case isMaximumExclusive = "exclusiveMaximum"
    }

    // MARK: - Instance Properties

    /// The raw value of the format.
    public var rawFormat: String?

    /// Specifies that a number must be the multiple of given number.
    /// Must be a positive number.
    public var multipleOf: T?

    /// Default value.
    public var defaultValue: T?

    /// An enumeration of possible values.
    public var enumeration: [T]?

    /// Lower bound of possible values.
    public var minimum: SpecSchemaValueBound<T>?

    /// Upper bound of possible values.
    public var maximum: SpecSchemaValueBound<T>?

    // MARK: - Initializers

    /// Creates a new instance with the provided values.
    public init(
        rawFormat: String? = nil,
        multipleOf: T? = nil,
        defaultValue: T? = nil,
        enumeration: [T]? = nil,
        minimum: SpecSchemaValueBound<T>? = nil,
        maximum: SpecSchemaValueBound<T>? = nil
    ) {
        self.rawFormat = rawFormat

        self.multipleOf = multipleOf
        self.defaultValue = defaultValue
        self.enumeration = enumeration

        self.minimum = minimum
        self.maximum = maximum
    }

    /// Creates a new instance by decoding from the given decoder.
    ///
    /// This initializer throws an error if reading from the decoder fails, or
    /// if the data read is corrupted or otherwise invalid.
    ///
    /// - Parameter decoder: The decoder to read data from.
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        rawFormat = try container.decodeIfPresent(forKey: .rawFormat)

        multipleOf = try container.decodeIfPresent(forKey: .multipleOf)
        defaultValue = try container.decodeIfPresent(forKey: .defaultValue)
        enumeration = try container.decodeIfPresent(forKey: .enumeration)

        minimum = try container
            .decodeIfPresent(T.self, forKey: .minimumValue)
            .map { minimumValue in
                SpecSchemaValueBound(
                    minimumValue,
                    isExclusive: try container.decodeIfPresent(forKey: .isMinimumExclusive)
                )
            }

        maximum = try container
            .decodeIfPresent(T.self, forKey: .maximumValue)
            .map { maximumValue in
                SpecSchemaValueBound(
                    maximumValue,
                    isExclusive: try container.decodeIfPresent(forKey: .isMaximumExclusive)
                )
            }
    }

    // MARK: - Instance Methods

    /// Encodes this instance into the given encoder.
    ///
    /// This function throws an error if any values are invalid for the given encoder's format.
    ///
    /// - Parameter encoder: The encoder to write data to.
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(rawFormat, forKey: .rawFormat)

        try container.encodeIfPresent(multipleOf, forKey: .multipleOf)
        try container.encodeIfPresent(defaultValue, forKey: .defaultValue)
        try container.encodeIfPresent(enumeration, forKey: .enumeration)

        try container.encodeIfPresent(minimum?.value, forKey: .minimumValue)
        try container.encodeIfPresent(minimum?.isExclusive, forKey: .isMinimumExclusive)

        try container.encodeIfPresent(maximum?.value, forKey: .maximumValue)
        try container.encodeIfPresent(maximum?.isExclusive, forKey: .isMaximumExclusive)
    }
}
