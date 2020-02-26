import Foundation
import SwaggerKit

enum SwaggerNumberSchemaSeeds {

    // MARK: - Type Properties

    static let anyYAML = "{}"
    static let any = SwaggerNumberSchema()

    static let ratingYAML = """
        multipleOf: 1e-1
        minimum: 1e+0
        exclusiveMinimum: false
        maximum: 5e+0
        exclusiveMaximum: false
        """

    static let rating = SwaggerNumberSchema(
        multipleOf: 0.1,
        minimum: SwaggerSchemaValueBound(1.0, isExclusive: false),
        maximum: SwaggerSchemaValueBound(5.0, isExclusive: false)
    )

    static let priceCategoryYAML = """
        format: double
        default: 0e+0
        enum:
        - 0e+0
        - 9.9e-1
        - 1.99e+0
        - 2.99e+0
        """

    static let priceCategory = SwaggerNumberSchema(
        format: .double,
        defaultValue: 0.0,
        enumeration: [0.0, 0.99, 1.99, 2.99]
    )
}
