import Foundation
import SwaggerKit

enum SwaggerRequestBodyMediaTypeSeeds {

    // MARK: - Type Properties

    static let anyYAML = "{}"
    static let any = SwaggerRequestBodyMediaType()

    static let languagesYAML = """
        schema:
        \(SwaggerSchemaSeeds.languagesYAML.yamlIndented(level: 1))
        example:
        \(SwaggerEmbeddedExampleSeeds.languagesYAML)
        """

    static let languages = SwaggerRequestBodyMediaType(
        schema: SwaggerComponent(value: SwaggerSchemaSeeds.languages),
        example: SwaggerEmbeddedExampleSeeds.languages
    )

    static let imageFileYAML = """
        schema:
        \(SwaggerSchemaSeeds.imageFileYAML.yamlIndented(level: 1))
        encoding:
          file:
        \(SwaggerRequestBodyEncodingSeeds.imageFileYAML.yamlIndented(level: 2))
        examples:
          first:
            $ref: '#/components/examples/FirstLanguages'
          second:
            $ref: '#/components/examples/SecondLanguages'
        """

    static let imageFile = SwaggerRequestBodyMediaType(
        schema: SwaggerComponent(value: SwaggerSchemaSeeds.imageFile),
        encoding: ["file": SwaggerRequestBodyEncodingSeeds.imageFile],
        examples: [
            "first": SwaggerComponent(referenceURI: "#/components/examples/FirstLanguages"),
            "second": SwaggerComponent(referenceURI: "#/components/examples/SecondLanguages")
        ]
    )

    static let appInfoYAML = """
        schema:
          $ref: '#/components/schemas/AppInfo'
        x-private: true
        """

    static let appInfo = SwaggerRequestBodyMediaType(
        schema: SwaggerComponent(referenceURI: "#/components/schemas/AppInfo"),
        extensions: ["private": true]
    )
}
