import Foundation

/// An object representing a metadata of the header.
/// Get more info: https://swagger.io/specification/#headerObject
public struct SpecHeaderMetadata: Codable, Equatable, Changeable {

    // MARK: - Nested Types

    private enum CodingKeys: String, CodingKey {
        case description
        case isRequired = "required"
        case isDeprecated = "deprecated"
    }

    // MARK: - Instance Properties

    /// A brief description of the header. This could contain examples of use.
    /// [CommonMark syntax](http://spec.commonmark.org/) may be used for rich text representation.
    public var description: String?

    /// Determines whether this header is mandatory.
    /// Default value is `false`.
    public var isRequired: Bool?

    /// Specifies that a header is deprecated and should be transitioned out of usage.
    /// Default value is `false`.
    public var isDeprecated: Bool?

    // MARK: - Initializers

    /// Creates a new instance with the provided values.
    public init(
        description: String? = nil,
        isRequired: Bool? = nil,
        isDeprecated: Bool? = nil
    ) {
        self.description = description
        self.isRequired = isRequired
        self.isDeprecated = isDeprecated
    }
}
