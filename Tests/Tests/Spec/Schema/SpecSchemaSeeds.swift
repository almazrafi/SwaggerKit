import Foundation
import SwaggerKit

enum SpecSchemaSeeds {

    // MARK: - Type Properties

    static let anyYAML = "{}"
    static let any = SpecSchema.any

    static let booleanYAML = "type: boolean"
    static let boolean = SpecSchema(type: .boolean(SpecBooleanSchemaSeeds.any))

    static let integerYAML = "type: integer"
    static let integer = SpecSchema(type: .integer(SpecIntegerSchemaSeeds.any))

    static let numberYAML = "type: number"
    static let number = SpecSchema(type: .number(SpecNumberSchemaSeeds.any))

    static let stringYAML = "type: string"
    static let string = SpecSchema(type: .string(SpecStringSchemaSeeds.any))

    static let arrayYAML = """
        type: array
        \(SpecArraySchemaSeeds.anyYAML)
        """

    static let array = SpecSchema(type: .array(SpecArraySchemaSeeds.any))

    static let objectYAML = """
        type: object
        \(SpecObjectSchemaSeeds.anyYAML)
        """

    static let object = SpecSchema(type: .object(SpecObjectSchemaSeeds.any))

    static let allOfYAML = """
        allOf:
        - $ref: '#/components/schemas/media'
        - type: object
        \(SpecObjectSchemaSeeds.anyYAML.yamlIndented(level: 1))
        """

    static let allOf = SpecSchema(
        type: .allOf(
            schemas: [
                SpecComponent(referenceURI: "#/components/schemas/media"),
                SpecComponent(value: SpecSchema(type: .object(SpecObjectSchemaSeeds.any)))
            ]
        )
    )

    static let anyOfYAML = """
        anyOf:
        - type: object
        \(SpecObjectSchemaSeeds.anyYAML.yamlIndented(level: 1))
        - $ref: '#/components/schemas/media'
        """

    static let anyOf = SpecSchema(
        type: .anyOf(
            schemas: [
                SpecComponent(value: SpecSchema(type: .object(SpecObjectSchemaSeeds.any))),
                SpecComponent(referenceURI: "#/components/schemas/media")
            ],
            discriminator: nil
        )
    )

    static let oneOfYAML = """
        oneOf:
        - $ref: '#/components/schemas/image'
        - $ref: '#/components/schemas/video'
        discriminator:
        \(SpecSchemaDiscriminatorSeeds.mediaTypeYAML.yamlIndented(level: 1))
        """

    static let oneOf = SpecSchema(
        type: .oneOf(
            schemas: [
                SpecComponent(referenceURI: "#/components/schemas/image"),
                SpecComponent(referenceURI: "#/components/schemas/video")
            ],
            discriminator: SpecSchemaDiscriminatorSeeds.mediaType
        )
    )

    static let availabilityYAML = """
        type: boolean
        \(SpecBooleanSchemaSeeds.availabilityYAML)
        \(SpecSchemaMetadataSeeds.availabilityYAML)
        """

    static let availability = SpecSchema(
        type: .boolean(SpecBooleanSchemaSeeds.availability),
        metadata: SpecSchemaMetadataSeeds.availability
    )

    static let videoDurationYAML = """
        type: integer
        \(SpecIntegerSchemaSeeds.videoDurationYAML)
        \(SpecSchemaMetadataSeeds.videoDurationYAML)
        """

    static let videoDuration = SpecSchema(
        type: .integer(SpecIntegerSchemaSeeds.videoDuration),
        metadata: SpecSchemaMetadataSeeds.videoDuration
    )

    static let contentRatingYAML = """
        type: integer
        \(SpecIntegerSchemaSeeds.contentRatingYAML)
        """

    static let contentRating = SpecSchema(type: .integer(SpecIntegerSchemaSeeds.contentRating))

    static let uidYAML = """
        type: integer
        \(SpecIntegerSchemaSeeds.uidYAML)
        \(SpecSchemaMetadataSeeds.uidYAML)
        """

    static let uid = SpecSchema(
        type: .integer(SpecIntegerSchemaSeeds.uid),
        metadata: SpecSchemaMetadataSeeds.uid
    )

    static let ratingYAML = """
        type: number
        \(SpecNumberSchemaSeeds.ratingYAML)
        \(SpecSchemaMetadataSeeds.ratingYAML)
        """

    static let rating = SpecSchema(
        type: .number(SpecNumberSchemaSeeds.rating),
        metadata: SpecSchemaMetadataSeeds.rating
    )

    static let priceCategoryYAML = """
        type: number
        \(SpecNumberSchemaSeeds.priceCategoryYAML)
        """

    static let priceCategory = SpecSchema(type: .number(SpecNumberSchemaSeeds.priceCategory))

    static let emailYAML = """
        type: string
        \(SpecStringSchemaSeeds.emailYAML)
        \(SpecSchemaMetadataSeeds.emailYAML)
        """

    static let email = SpecSchema(
        type: .string(SpecStringSchemaSeeds.email),
        metadata: SpecSchemaMetadataSeeds.email
    )

    static let mediaTypeYAML = """
        type: string
        \(SpecStringSchemaSeeds.mediaTypeYAML)
        """

    static let mediaType = SpecSchema(type: .string(SpecStringSchemaSeeds.mediaType))

    static let dataYAML = """
        type: string
        \(SpecStringSchemaSeeds.dataYAML)
        """

    static let data = SpecSchema(type: .string(SpecStringSchemaSeeds.data))

    static let stringToStringYAML = """
        type: object
        \(SpecObjectSchemaSeeds.stringToStringYAML)
        """

    static let stringToString = SpecSchema(type: .object(SpecObjectSchemaSeeds.stringToString))

    static let implicitImageSizeYAML = """
        \(SpecObjectSchemaSeeds.imageSizeYAML)
        \(SpecSchemaMetadataSeeds.imageSizeYAML)
        """

    static let imageSizeYAML = """
        \(implicitImageSizeYAML)
        type: object
        """

    static let imageSize = SpecSchema(
        type: .object(SpecObjectSchemaSeeds.imageSize),
        metadata: SpecSchemaMetadataSeeds.imageSize
    )

    static let implicitLanguagesYAML = """
        \(SpecArraySchemaSeeds.languagesYAML)
        \(SpecSchemaMetadataSeeds.languagesYAML)
        """

    static let languagesYAML = """
        \(implicitLanguagesYAML)
        type: array
        """

    static let languages = SpecSchema(
        type: .array(SpecArraySchemaSeeds.languages),
        metadata: SpecSchemaMetadataSeeds.languages
    )

    static let imageFileYAML = """
        type: object
        additionalProperties: false
        properties:
          file:
        \(dataYAML.yamlIndented(level: 2))
        x-private: true
        """

    static let imageFile = SpecSchema(
        type: .object(SpecObjectSchema(properties: ["file": SpecComponent(value: data)])),
        extensions: ["private": true]
    )
}
