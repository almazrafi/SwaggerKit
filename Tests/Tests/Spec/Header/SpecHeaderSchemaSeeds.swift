import Foundation
import SwaggerKit

enum SpecHeaderSchemaSeeds {

    // MARK: - Type Properties

    static let rateLimitLimitYAML = """
        schema:
        \(SpecSchemaSeeds.integerYAML.yamlIndented(level: 1))
        """

    static let rateLimitLimit = SpecHeaderSchema(schema: SpecComponent(value: SpecSchemaSeeds.integer))

    static let uidYAML = """
        schema:
        \(SpecSchemaSeeds.uidYAML.yamlIndented(level: 1))
        example: \(SpecEmbeddedExampleSeeds.uidYAML)
        """

    static let uid = SpecHeaderSchema(
        schema: SpecComponent(value: SpecSchemaSeeds.uid),
        example: SpecEmbeddedExampleSeeds.uid
    )

    static let emailYAML = """
        schema:
        \(SpecSchemaSeeds.emailYAML.yamlIndented(level: 1))
        examples:
          first:
        \(SpecExampleSeeds.emailYAML.yamlIndented(level: 2))
          second:
            $ref: '#/components/examples/SecondEmail'
        """

    static let email = SpecHeaderSchema(
        schema: SpecComponent(value: SpecSchemaSeeds.email),
        examples: [
            "first": SpecComponent(value: SpecExampleSeeds.email),
            "second": SpecComponent(referenceURI: "#/components/examples/SecondEmail")
        ]
    )

    static let locationYAML = """
        schema:
          $ref: '#/components/examples/Location'
        explode: true
        """

    static let location = SpecHeaderSchema(
        schema: SpecComponent(referenceURI: "#/components/examples/Location"),
        isExploded: true
    )
}
