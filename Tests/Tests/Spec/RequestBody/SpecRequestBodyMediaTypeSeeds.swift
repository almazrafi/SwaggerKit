import Foundation
import SwaggerKit

enum SpecRequestBodyMediaTypeSeeds {

    // MARK: - Type Properties

    static let anyYAML = "{}"
    static let any = SpecRequestBodyMediaType()

    static let languagesYAML = """
        schema:
        \(SpecSchemaSeeds.languagesYAML.yamlIndented(level: 1))
        example:
        \(SpecEmbeddedExampleSeeds.languagesYAML)
        """

    static let languages = SpecRequestBodyMediaType(
        schema: SpecComponent(value: SpecSchemaSeeds.languages),
        example: SpecEmbeddedExampleSeeds.languages
    )

    static let imageFileYAML = """
        schema:
        \(SpecSchemaSeeds.imageFileYAML.yamlIndented(level: 1))
        encoding:
          file:
        \(SpecRequestBodyEncodingSeeds.imageFileYAML.yamlIndented(level: 2))
        examples:
          first:
            $ref: '#/components/examples/FirstLanguages'
          second:
            $ref: '#/components/examples/SecondLanguages'
        """

    static let imageFile = SpecRequestBodyMediaType(
        schema: SpecComponent(value: SpecSchemaSeeds.imageFile),
        encoding: ["file": SpecRequestBodyEncodingSeeds.imageFile],
        examples: [
            "first": SpecComponent(referenceURI: "#/components/examples/FirstLanguages"),
            "second": SpecComponent(referenceURI: "#/components/examples/SecondLanguages")
        ]
    )

    static let appInfoYAML = """
        schema:
          $ref: '#/components/schemas/AppInfo'
        x-private: true
        """

    static let appInfo = SpecRequestBodyMediaType(
        schema: SpecComponent(referenceURI: "#/components/schemas/AppInfo"),
        extensions: ["private": true]
    )
}
