import Foundation
import SwaggerKit

enum SwaggerMediaTypeSeeds {

    // MARK: - Type Properties

    static let uidYAML = """
        schema:
        \(SwaggerSchemaSeeds.uidYAML.yamlIndented(level: 1))
        example: \(SwaggerEmbeddedExampleSeeds.uidYAML)
        """

    static let uid = SwaggerMediaType(
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

    static let email = SwaggerMediaType(
        schema: SwaggerComponent(value: SwaggerSchemaSeeds.email),
        examples: [
            "first": SwaggerComponent(value: SwaggerExampleSeeds.email),
            "second": SwaggerComponent(referenceURI: "#/components/examples/SecondEmail")
        ]
    )

    static let languagesYAML = """
        schema:
        \(SwaggerSchemaSeeds.languagesYAML.yamlIndented(level: 1))
        """

    static let languages = SwaggerMediaType(schema: SwaggerComponent(value: SwaggerSchemaSeeds.languages))

    static let locationYAML = """
        schema:
          $ref: '#/components/schemas/Location'
        """

    static let location = SwaggerMediaType(schema: SwaggerComponent(referenceURI: "#/components/schemas/Location"))

    static let appInfoYAML = """
        schema:
          $ref: '#/components/schemas/AppInfo'
        x-private: true
        """

    static let appInfo = SwaggerMediaType(
        schema: SwaggerComponent(referenceURI: "#/components/schemas/AppInfo"),
        extensions: ["private": true]
    )
}
