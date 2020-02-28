import Foundation
import SwaggerKit

enum SpecObjectSchemaSeeds {

    // MARK: - Type Properties

    static let implicitlyAnyYAML = "{}"
    static let anyYAML = "additionalProperties: true"
    static let any = SpecObjectSchema(additionalProperties: SpecComponent(value: .any))

    static let stringToStringYAML = """
        additionalProperties:
        \(SpecSchemaSeeds.stringYAML.yamlIndented(level: 1))
        maxProperties: 12
        minProperties: 3
        """

    static let stringToString = SpecObjectSchema(
        additionalProperties: SpecComponent(value: SpecSchemaSeeds.string),
        minPropertyCount: 3,
        maxPropertyCount: 12
    )

    static let imageSizeYAML = """
        additionalProperties: false
        properties:
          width:
        \(SpecSchemaSeeds.integerYAML.yamlIndented(level: 2))
          height:
        \(SpecSchemaSeeds.integerYAML.yamlIndented(level: 2))
        required:
        - width
        - height
        """

    static let imageSize = SpecObjectSchema(
        properties: [
            "width": SpecComponent(value: SpecSchemaSeeds.integer),
            "height": SpecComponent(value: SpecSchemaSeeds.integer)
        ],
        requiredProperties: ["width", "height"]
    )

    static let imageYAML = """
        additionalProperties: false
        properties:
          size:
        \(SpecSchemaSeeds.imageSizeYAML.yamlIndented(level: 2))
        required:
        - size
        """

    static let image = SpecObjectSchema(
        properties: ["size": SpecComponent(value: SpecSchemaSeeds.imageSize)],
        requiredProperties: ["size"]
    )

    static let videoYAML = """
        additionalProperties: false
        properties:
          duration:
        \(SpecSchemaSeeds.videoDurationYAML.yamlIndented(level: 2))
        required:
        - duration
        """

    static let video = SpecObjectSchema(
        properties: ["duration": SpecComponent(value: SpecSchemaSeeds.videoDuration)],
        requiredProperties: ["duration"]
    )

    static let mediaYAML = """
        additionalProperties: false
        properties:
          mediaType:
        \(SpecSchemaSeeds.mediaTypeYAML.yamlIndented(level: 2))
          url:
        \(SpecSchemaSeeds.stringYAML.yamlIndented(level: 2))
        required:
        - mediaType
        - url
        discriminator:
        \(SpecSchemaDiscriminatorSeeds.mediaTypeYAML.yamlIndented(level: 1))
        """

    static let media = SpecObjectSchema(
        properties: [
            "mediaType": SpecComponent(value: SpecSchemaSeeds.mediaType),
            "url": SpecComponent(value: SpecSchemaSeeds.string)
        ],
        requiredProperties: ["mediaType", "url"],
        discriminator: SpecSchemaDiscriminatorSeeds.mediaType
    )
}
