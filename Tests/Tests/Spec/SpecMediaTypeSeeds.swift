import Foundation
import SwaggerKit

enum SpecMediaTypeSeeds {

    // MARK: - Type Properties

    static let uidYAML = """
        schema:
        \(SpecSchemaSeeds.uidYAML.yamlIndented(level: 1))
        example: \(SpecEmbeddedExampleSeeds.uidYAML)
        """

    static let uid = SpecMediaType(
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

    static let email = SpecMediaType(
        schema: SpecComponent(value: SpecSchemaSeeds.email),
        examples: [
            "first": SpecComponent(value: SpecExampleSeeds.email),
            "second": SpecComponent(referenceURI: "#/components/examples/SecondEmail")
        ]
    )

    static let languagesYAML = """
        schema:
        \(SpecSchemaSeeds.languagesYAML.yamlIndented(level: 1))
        """

    static let languages = SpecMediaType(schema: SpecComponent(value: SpecSchemaSeeds.languages))

    static let locationYAML = """
        schema:
          $ref: '#/components/schemas/Location'
        """

    static let location = SpecMediaType(schema: SpecComponent(referenceURI: "#/components/schemas/Location"))

    static let appInfoYAML = """
        schema:
          $ref: '#/components/schemas/AppInfo'
        x-private: true
        """

    static let appInfo = SpecMediaType(
        schema: SpecComponent(referenceURI: "#/components/schemas/AppInfo"),
        extensions: ["private": true]
    )
}
