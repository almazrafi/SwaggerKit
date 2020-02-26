import Foundation
import SwaggerKit

enum SwaggerParameterSchemaSeeds {

    // MARK: - Type Properties

    static let uidYAML = """
        schema:
        \(SwaggerSchemaSeeds.uidYAML.yamlIndented(level: 1))
        example: \(SwaggerEmbeddedExampleSeeds.uidYAML)
        """

    static let uid = SwaggerParameterSchema(
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

    static let email = SwaggerParameterSchema(
        schema: SwaggerComponent(value: SwaggerSchemaSeeds.email),
        examples: [
            "first": SwaggerComponent(value: SwaggerExampleSeeds.email),
            "second": SwaggerComponent(referenceURI: "#/components/examples/SecondEmail")
        ]
    )

    static let locationYAML = """
        schema:
          $ref: '#/components/examples/Location'
        style: deepObject
        explode: true
        allowReserved: true
        """

    static let location = SwaggerParameterSchema(
        schema: SwaggerComponent(referenceURI: "#/components/examples/Location"),
        style: .deepObject,
        isExploded: true,
        isAllowedReserved: true
    )
}
