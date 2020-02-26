import Foundation
import SwaggerKit

enum SwaggerArraySchemaSeeds {

    // MARK: - Type Properties

    static let anyYAML = """
        items: {}
        """

    static let any = SwaggerArraySchema(itemsSchema: SwaggerComponent(value: SwaggerSchemaSeeds.any))

    static let languagesYAML = """
        items:
        \(SwaggerSchemaSeeds.stringYAML.yamlIndented(level: 1))
        minItems: 1
        maxItems: 100
        uniqueItems: true
        """

    static let languages = SwaggerArraySchema(
        itemsSchema: SwaggerComponent(value: SwaggerSchemaSeeds.string),
        minItemCount: 1,
        maxItemCount: 100,
        isItemsUnique: true
    )
}
