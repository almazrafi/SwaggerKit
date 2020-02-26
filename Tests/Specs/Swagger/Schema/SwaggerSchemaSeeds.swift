import Foundation
import SwaggerKit

enum SwaggerSchemaSeeds {

    // MARK: - Type Properties

    static let anyYAML = "{}"
    static let any = SwaggerSchema.any

    static let booleanYAML = "type: boolean"
    static let boolean = SwaggerSchema(type: .boolean(SwaggerBooleanSchemaSeeds.any))

    static let integerYAML = "type: integer"
    static let integer = SwaggerSchema(type: .integer(SwaggerIntegerSchemaSeeds.any))

    static let numberYAML = "type: number"
    static let number = SwaggerSchema(type: .number(SwaggerNumberSchemaSeeds.any))

    static let stringYAML = "type: string"
    static let string = SwaggerSchema(type: .string(SwaggerStringSchemaSeeds.any))

    static let arrayYAML = """
        type: array
        \(SwaggerArraySchemaSeeds.anyYAML)
        """

    static let array = SwaggerSchema(type: .array(SwaggerArraySchemaSeeds.any))

    static let objectYAML = """
        type: object
        \(SwaggerObjectSchemaSeeds.anyYAML)
        """

    static let object = SwaggerSchema(type: .object(SwaggerObjectSchemaSeeds.any))

    static let allOfYAML = """
        allOf:
        - $ref: '#/components/schemas/media'
        - type: object
        \(SwaggerObjectSchemaSeeds.anyYAML.yamlIndented(level: 1))
        """

    static let allOf = SwaggerSchema(
        type: .allOf(
            schemas: [
                SwaggerComponent(referenceURI: "#/components/schemas/media"),
                SwaggerComponent(value: SwaggerSchema(type: .object(SwaggerObjectSchemaSeeds.any)))
            ]
        )
    )

    static let anyOfYAML = """
        anyOf:
        - type: object
        \(SwaggerObjectSchemaSeeds.anyYAML.yamlIndented(level: 1))
        - $ref: '#/components/schemas/media'
        """

    static let anyOf = SwaggerSchema(
        type: .anyOf(
            schemas: [
                SwaggerComponent(value: SwaggerSchema(type: .object(SwaggerObjectSchemaSeeds.any))),
                SwaggerComponent(referenceURI: "#/components/schemas/media")
            ],
            discriminator: nil
        )
    )

    static let oneOfYAML = """
        oneOf:
        - $ref: '#/components/schemas/image'
        - $ref: '#/components/schemas/video'
        discriminator:
        \(SwaggerSchemaDiscriminatorSeeds.mediaTypeYAML.yamlIndented(level: 1))
        """

    static let oneOf = SwaggerSchema(
        type: .oneOf(
            schemas: [
                SwaggerComponent(referenceURI: "#/components/schemas/image"),
                SwaggerComponent(referenceURI: "#/components/schemas/video")
            ],
            discriminator: SwaggerSchemaDiscriminatorSeeds.mediaType
        )
    )

    static let availabilityYAML = """
        type: boolean
        \(SwaggerBooleanSchemaSeeds.availabilityYAML)
        \(SwaggerSchemaMetadataSeeds.availabilityYAML)
        """

    static let availability = SwaggerSchema(
        type: .boolean(SwaggerBooleanSchemaSeeds.availability),
        metadata: SwaggerSchemaMetadataSeeds.availability
    )

    static let videoDurationYAML = """
        type: integer
        \(SwaggerIntegerSchemaSeeds.videoDurationYAML)
        \(SwaggerSchemaMetadataSeeds.videoDurationYAML)
        """

    static let videoDuration = SwaggerSchema(
        type: .integer(SwaggerIntegerSchemaSeeds.videoDuration),
        metadata: SwaggerSchemaMetadataSeeds.videoDuration
    )

    static let contentRatingYAML = """
        type: integer
        \(SwaggerIntegerSchemaSeeds.contentRatingYAML)
        """

    static let contentRating = SwaggerSchema(type: .integer(SwaggerIntegerSchemaSeeds.contentRating))

    static let uidYAML = """
        type: integer
        \(SwaggerIntegerSchemaSeeds.uidYAML)
        \(SwaggerSchemaMetadataSeeds.uidYAML)
        """

    static let uid = SwaggerSchema(
        type: .integer(SwaggerIntegerSchemaSeeds.uid),
        metadata: SwaggerSchemaMetadataSeeds.uid
    )

    static let ratingYAML = """
        type: number
        \(SwaggerNumberSchemaSeeds.ratingYAML)
        \(SwaggerSchemaMetadataSeeds.ratingYAML)
        """

    static let rating = SwaggerSchema(
        type: .number(SwaggerNumberSchemaSeeds.rating),
        metadata: SwaggerSchemaMetadataSeeds.rating
    )

    static let priceCategoryYAML = """
        type: number
        \(SwaggerNumberSchemaSeeds.priceCategoryYAML)
        """

    static let priceCategory = SwaggerSchema(type: .number(SwaggerNumberSchemaSeeds.priceCategory))

    static let emailYAML = """
        type: string
        \(SwaggerStringSchemaSeeds.emailYAML)
        \(SwaggerSchemaMetadataSeeds.emailYAML)
        """

    static let email = SwaggerSchema(
        type: .string(SwaggerStringSchemaSeeds.email),
        metadata: SwaggerSchemaMetadataSeeds.email
    )

    static let mediaTypeYAML = """
        type: string
        \(SwaggerStringSchemaSeeds.mediaTypeYAML)
        """

    static let mediaType = SwaggerSchema(type: .string(SwaggerStringSchemaSeeds.mediaType))

    static let dataYAML = """
        type: string
        \(SwaggerStringSchemaSeeds.dataYAML)
        """

    static let data = SwaggerSchema(type: .string(SwaggerStringSchemaSeeds.data))

    static let stringToStringYAML = """
        type: object
        \(SwaggerObjectSchemaSeeds.stringToStringYAML)
        """

    static let stringToString = SwaggerSchema(type: .object(SwaggerObjectSchemaSeeds.stringToString))

    static let implicitImageSizeYAML = """
        \(SwaggerObjectSchemaSeeds.imageSizeYAML)
        \(SwaggerSchemaMetadataSeeds.imageSizeYAML)
        """

    static let imageSizeYAML = """
        \(implicitImageSizeYAML)
        type: object
        """

    static let imageSize = SwaggerSchema(
        type: .object(SwaggerObjectSchemaSeeds.imageSize),
        metadata: SwaggerSchemaMetadataSeeds.imageSize
    )

    static let implicitLanguagesYAML = """
        \(SwaggerArraySchemaSeeds.languagesYAML)
        \(SwaggerSchemaMetadataSeeds.languagesYAML)
        """

    static let languagesYAML = """
        \(implicitLanguagesYAML)
        type: array
        """

    static let languages = SwaggerSchema(
        type: .array(SwaggerArraySchemaSeeds.languages),
        metadata: SwaggerSchemaMetadataSeeds.languages
    )

    static let imageFileYAML = """
        type: object
        additionalProperties: false
        properties:
          file:
        \(dataYAML.yamlIndented(level: 2))
        x-private: true
        """

    static let imageFile = SwaggerSchema(
        type: .object(SwaggerObjectSchema(properties: ["file": SwaggerComponent(value: data)])),
        extensions: ["private": true]
    )
}
