import Foundation
import SwaggerKit

enum SpecAnySchemaSeeds {

    // MARK: - Type Properties

    static let anyYAML = "{}"
    static let any = SpecAnySchema()

    static let notIntegerYAML = """
        not:
        \(SpecSchemaSeeds.integerYAML.yamlIndented(level: 1))
        """

    static let notInteger = SpecAnySchema(exceptionSchema: SpecComponent(value: SpecSchemaSeeds.integer))
}
