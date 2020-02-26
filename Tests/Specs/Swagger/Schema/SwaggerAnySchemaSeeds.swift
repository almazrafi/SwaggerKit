import Foundation
import SwaggerKit

enum SwaggerAnySchemaSeeds {

    // MARK: - Type Properties

    static let anyYAML = "{}"
    static let any = SwaggerAnySchema()

    static let notIntegerYAML = """
        not:
        \(SwaggerSchemaSeeds.integerYAML.yamlIndented(level: 1))
        """

    static let notInteger = SwaggerAnySchema(exceptionSchema: SwaggerComponent(value: SwaggerSchemaSeeds.integer))
}
