import Foundation
import SwaggerKit

enum SwaggerIntegerSchemaSeeds {

    // MARK: - Type Properties

    static let anyYAML = "{}"
    static let any = SwaggerIntegerSchema()

    static let videoDurationYAML = """
        multipleOf: 1
        minimum: 8
        exclusiveMinimum: true
        maximum: 32
        exclusiveMaximum: true
        """

    static let videoDuration = SwaggerIntegerSchema(
        multipleOf: 1,
        minimum: SwaggerSchemaValueBound(8, isExclusive: true),
        maximum: SwaggerSchemaValueBound(32, isExclusive: true)
    )

    static let contentRatingYAML = """
        default: 17
        enum:
        - 4
        - 9
        - 12
        - 17
        """

    static let contentRating = SwaggerIntegerSchema(
        defaultValue: 17,
        enumeration: [4, 9, 12, 17]
    )

    static let uidYAML = "format: int64"
    static let uid = SwaggerIntegerSchema(format: .int64)
}
