import Foundation
import SwaggerKit

enum SpecArraySchemaSeeds {

    // MARK: - Type Properties

    static let anyYAML = """
        items: {}
        """

    static let any = SpecArraySchema(itemsSchema: SpecComponent(value: SpecSchemaSeeds.any))

    static let languagesYAML = """
        items:
        \(SpecSchemaSeeds.stringYAML.yamlIndented(level: 1))
        minItems: 1
        maxItems: 100
        uniqueItems: true
        """

    static let languages = SpecArraySchema(
        itemsSchema: SpecComponent(value: SpecSchemaSeeds.string),
        minItemCount: 1,
        maxItemCount: 100,
        isItemsUnique: true
    )
}
