import Foundation

/// An object representing a metadata of the schema.
/// Get more info: https://swagger.io/specification/#schemaObject
public struct SpecSchemaMetadata: Codable, Equatable, Changeable {

    // MARK: - Nested Types

    private enum CodingKeys: String, CodingKey {
        case title
        case description

        case xml
        case externalDocs

        case isReadOnly = "readOnly"
        case isWriteOnly = "writeOnly"
        case isDeprecated = "deprecated"
        case isNullable = "nullable"

        case example
    }

    // MARK: - Type Properties

    /// Empty metadata instance.
    public static let empty = SpecSchemaMetadata()

    // MARK: - Instance Properties

    /// The title of the schema.
    public var title: String?

    /// Explanation about the purpose of the data described by the schema.
    /// [CommonMark syntax](http://spec.commonmark.org/) may be used for rich text representation.
    public var description: String?

    /// Adds additional metadata to describe the XML representation.
    /// This may be used only on properties schemas. It has no effect on root schemas.
    public var xml: SpecSchemaXML?

    /// Additional external documentation for this schema.
    public var externalDocs: SpecExternalDocs?

    /// Relevant only for Schema "`properties`" definitions. Declares the property as "read only".
    /// This means that it may be sent as part of a response but should not be sent as part of the request.
    /// If the property is marked as "read only" and is in the `required` list,
    /// the `required` will take effect on the response only.
    /// A property must not be marked as both "read only" and "write only".
    /// Default value is `false`.
    public var isReadOnly: Bool?

    /// Relevant only for Schema "`properties`" definitions. Declares the property as "write only".
    /// This means that it may be sent as part of a request but should not be sent as part of the response.
    /// If the property is marked as "write only" and is in the `required` list,
    /// the `required` will take effect on the request only.
    /// A property must not be marked as both "read only" and "write only".
    /// Default value is `false`.
    public var isWriteOnly: Bool?

    /// Specifies that a schema is deprecated and should be transitioned out of usage.
    /// Default value is `false`.
    public var isDeprecated: Bool?

    /// Allows sending a null value for the defined schema.
    /// Default value is `false`.
    public var isNullable: Bool?

    /// An example of an instance for this schema.
    public var example: SpecEmbeddedExample?

    // MARK: - Initializers

    /// Creates a new instance with the provided values.
    public init(
        title: String? = nil,
        description: String? = nil,
        xml: SpecSchemaXML? = nil,
        externalDocs: SpecExternalDocs? = nil,
        isReadOnly: Bool? = nil,
        isWriteOnly: Bool? = nil,
        isDeprecated: Bool? = nil,
        isNullable: Bool? = nil,
        example: SpecEmbeddedExample? = nil
    ) {
        self.title = title
        self.description = description

        self.xml = xml
        self.externalDocs = externalDocs

        self.isReadOnly = isReadOnly
        self.isWriteOnly = isWriteOnly
        self.isDeprecated = isDeprecated
        self.isNullable = isNullable

        self.example = example
    }
}
