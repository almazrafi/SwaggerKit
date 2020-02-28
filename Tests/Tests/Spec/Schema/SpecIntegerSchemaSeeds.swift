import Foundation
import SwaggerKit

enum SpecIntegerSchemaSeeds {

    // MARK: - Type Properties

    static let anyYAML = "{}"
    static let any = SpecIntegerSchema()

    static let videoDurationYAML = """
        multipleOf: 1
        minimum: 8
        exclusiveMinimum: true
        maximum: 32
        exclusiveMaximum: true
        """

    static let videoDuration = SpecIntegerSchema(
        multipleOf: 1,
        minimum: SpecSchemaValueBound(8, isExclusive: true),
        maximum: SpecSchemaValueBound(32, isExclusive: true)
    )

    static let contentRatingYAML = """
        default: 17
        enum:
        - 4
        - 9
        - 12
        - 17
        """

    static let contentRating = SpecIntegerSchema(
        defaultValue: 17,
        enumeration: [4, 9, 12, 17]
    )

    static let uidYAML = "format: int64"
    static let uid = SpecIntegerSchema(format: .int64)
}
