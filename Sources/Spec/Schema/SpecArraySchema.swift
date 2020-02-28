import Foundation

/// An object representing an array schema type.
/// Get more info: https://swagger.io/specification/#schemaObject
public struct SpecArraySchema: Codable, Equatable {

    // MARK: - Nested Types

    private enum CodingKeys: String, CodingKey {
        case itemsSchema = "items"

        case minItemCount = "minItems"
        case maxItemCount = "maxItems"

        case isItemsUnique = "uniqueItems"
    }

    // MARK: - Type Properties

    internal static let typeCodingValue = "array"

    // MARK: - Instance Properties

    /// A schema that describes the type and format of array items.
    /// Arrays can be nested and contain objects.
    public var itemsSchema: SpecComponent<SpecSchema>

    /// The minimum length of the array.
    public var minItemCount: Int?

    /// The maximum length of the array.
    public var maxItemCount: Int?

    /// Specifies that all items in the array must be unique.
    /// Default value is `false`.
    public var isItemsUnique: Bool?

    // MARK: - Initializers

    /// Creates a new instance with the provided values.
    public init(
        itemsSchema: SpecComponent<SpecSchema>,
        minItemCount: Int? = nil,
        maxItemCount: Int? = nil,
        isItemsUnique: Bool? = nil
    ) {
        self.itemsSchema = itemsSchema

        self.minItemCount = minItemCount
        self.maxItemCount = maxItemCount

        self.isItemsUnique = isItemsUnique
    }
}
