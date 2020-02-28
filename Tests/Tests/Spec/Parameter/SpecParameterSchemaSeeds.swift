import Foundation
import SwaggerKit

enum SpecParameterSchemaSeeds {

    // MARK: - Type Properties

    static let uidYAML = """
        schema:
        \(SpecSchemaSeeds.uidYAML.yamlIndented(level: 1))
        example: \(SpecEmbeddedExampleSeeds.uidYAML)
        """

    static let uid = SpecParameterSchema(
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

    static let email = SpecParameterSchema(
        schema: SpecComponent(value: SpecSchemaSeeds.email),
        examples: [
            "first": SpecComponent(value: SpecExampleSeeds.email),
            "second": SpecComponent(referenceURI: "#/components/examples/SecondEmail")
        ]
    )

    static let locationYAML = """
        schema:
          $ref: '#/components/examples/Location'
        style: deepObject
        explode: true
        allowReserved: true
        """

    static let location = SpecParameterSchema(
        schema: SpecComponent(referenceURI: "#/components/examples/Location"),
        style: .deepObject,
        isExploded: true,
        isAllowedReserved: true
    )
}
