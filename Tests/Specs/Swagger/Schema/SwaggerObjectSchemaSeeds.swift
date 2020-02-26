import Foundation
import SwaggerKit

enum SwaggerObjectSchemaSeeds {

    // MARK: - Type Properties

    static let implicitlyAnyYAML = "{}"
    static let anyYAML = "additionalProperties: true"
    static let any = SwaggerObjectSchema(additionalProperties: SwaggerComponent(value: .any))

    static let stringToStringYAML = """
        additionalProperties:
        \(SwaggerSchemaSeeds.stringYAML.yamlIndented(level: 1))
        maxProperties: 12
        minProperties: 3
        """

    static let stringToString = SwaggerObjectSchema(
        additionalProperties: SwaggerComponent(value: SwaggerSchemaSeeds.string),
        minPropertyCount: 3,
        maxPropertyCount: 12
    )

    static let imageSizeYAML = """
        additionalProperties: false
        properties:
          width:
        \(SwaggerSchemaSeeds.integerYAML.yamlIndented(level: 2))
          height:
        \(SwaggerSchemaSeeds.integerYAML.yamlIndented(level: 2))
        required:
        - width
        - height
        """

    static let imageSize = SwaggerObjectSchema(
        properties: [
            "width": SwaggerComponent(value: SwaggerSchemaSeeds.integer),
            "height": SwaggerComponent(value: SwaggerSchemaSeeds.integer)
        ],
        requiredProperties: ["width", "height"]
    )

    static let imageYAML = """
        additionalProperties: false
        properties:
          size:
        \(SwaggerSchemaSeeds.imageSizeYAML.yamlIndented(level: 2))
        required:
        - size
        """

    static let image = SwaggerObjectSchema(
        properties: ["size": SwaggerComponent(value: SwaggerSchemaSeeds.imageSize)],
        requiredProperties: ["size"]
    )

    static let videoYAML = """
        additionalProperties: false
        properties:
          duration:
        \(SwaggerSchemaSeeds.videoDurationYAML.yamlIndented(level: 2))
        required:
        - duration
        """

    static let video = SwaggerObjectSchema(
        properties: ["duration": SwaggerComponent(value: SwaggerSchemaSeeds.videoDuration)],
        requiredProperties: ["duration"]
    )

    static let mediaYAML = """
        additionalProperties: false
        properties:
          mediaType:
        \(SwaggerSchemaSeeds.mediaTypeYAML.yamlIndented(level: 2))
          url:
        \(SwaggerSchemaSeeds.stringYAML.yamlIndented(level: 2))
        required:
        - mediaType
        - url
        discriminator:
        \(SwaggerSchemaDiscriminatorSeeds.mediaTypeYAML.yamlIndented(level: 1))
        """

    static let media = SwaggerObjectSchema(
        properties: [
            "mediaType": SwaggerComponent(value: SwaggerSchemaSeeds.mediaType),
            "url": SwaggerComponent(value: SwaggerSchemaSeeds.string)
        ],
        requiredProperties: ["mediaType", "url"],
        discriminator: SwaggerSchemaDiscriminatorSeeds.mediaType
    )
}
