import Foundation
import SwaggerKit

enum SwaggerHeaderSchemaSeeds {

    // MARK: - Type Properties

    static let rateLimitLimitYAML = """
        schema:
        \(SwaggerSchemaSeeds.integerYAML.yamlIndented(level: 1))
        """

    static let rateLimitLimit = SwaggerHeaderSchema(schema: SwaggerComponent(value: SwaggerSchemaSeeds.integer))

    static let uidYAML = """
        schema:
        \(SwaggerSchemaSeeds.uidYAML.yamlIndented(level: 1))
        example: \(SwaggerEmbeddedExampleSeeds.uidYAML)
        """

    static let uid = SwaggerHeaderSchema(
        schema: SwaggerComponent(value: SwaggerSchemaSeeds.uid),
        example: SwaggerEmbeddedExampleSeeds.uid
    )

    static let emailYAML = """
        schema:
        \(SwaggerSchemaSeeds.emailYAML.yamlIndented(level: 1))
        examples:
          first:
        \(SwaggerExampleSeeds.emailYAML.yamlIndented(level: 2))
          second:
            $ref: '#/components/examples/SecondEmail'
        """

    static let email = SwaggerHeaderSchema(
        schema: SwaggerComponent(value: SwaggerSchemaSeeds.email),
        examples: [
            "first": SwaggerComponent(value: SwaggerExampleSeeds.email),
            "second": SwaggerComponent(referenceURI: "#/components/examples/SecondEmail")
        ]
    )

    static let locationYAML = """
        schema:
          $ref: '#/components/examples/Location'
        explode: true
        """

    static let location = SwaggerHeaderSchema(
        schema: SwaggerComponent(referenceURI: "#/components/examples/Location"),
        isExploded: true
    )
}
