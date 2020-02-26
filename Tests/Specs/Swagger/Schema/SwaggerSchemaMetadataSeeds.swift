import Foundation
import SwaggerKit

enum SwaggerSchemaMetadataSeeds {

    // MARK: - Type Properties

    static let anyYAML = "{}"
    static let any = SwaggerSchemaMetadata()

    static let availabilityYAML = """
        description: Is the app available for download?
        writeOnly: true
        """

    static let availability = SwaggerSchemaMetadata(
        description: "Is the app available for download?",
        isWriteOnly: true
    )

    static let videoDurationYAML = """
        description: Video duration in seconds.
        readOnly: true
        deprecated: true
        example: \(SwaggerEmbeddedExampleSeeds.videoDurationYAML)
        """

    static let videoDuration = SwaggerSchemaMetadata(
        description: "Video duration in seconds.",
        isReadOnly: true,
        isDeprecated: true,
        example: SwaggerEmbeddedExampleSeeds.videoDuration
    )

    static let uidYAML = """
        description: Unique identifier of the resource.
        xml:
        \(SwaggerSchemaXMLSeeds.attributeYAML.yamlIndented(level: 1))
        readOnly: true
        example: \(SwaggerEmbeddedExampleSeeds.uidYAML)
        """

    static let uid = SwaggerSchemaMetadata(
        description: "Unique identifier of the resource.",
        xml: SwaggerComponent(value: SwaggerSchemaXMLSeeds.attribute),
        isReadOnly: true,
        example: SwaggerEmbeddedExampleSeeds.uid
    )

    static let ratingYAML = """
        title: Rating
        externalDocs:
        \(SwaggerExternalDocumentationSeeds.moreInfoYAML.yamlIndented(level: 1))
        readOnly: true
        """

    static let rating = SwaggerSchemaMetadata(
        title: "Rating",
        externalDocumentation: SwaggerExternalDocumentationSeeds.moreInfo,
        isReadOnly: true
    )

    static let emailYAML = """
        title: Email
        nullable: true
        example: \(SwaggerEmbeddedExampleSeeds.emailYAML)
        """

    static let email = SwaggerSchemaMetadata(
        title: "Email",
        isNullable: true,
        example: SwaggerEmbeddedExampleSeeds.email
    )

    static let languagesYAML = """
        description: List of localization languages represented as ISO 639-1 codes.
        example:
        \(SwaggerEmbeddedExampleSeeds.languagesYAML)
        """

    static let languages = SwaggerSchemaMetadata(
        description: "List of localization languages represented as ISO 639-1 codes.",
        example: SwaggerEmbeddedExampleSeeds.languages
    )

    static let imageSizeYAML = """
        description: Image width and height in pixels.
        readOnly: true
        example:
        \(SwaggerEmbeddedExampleSeeds.imageSizeYAML.yamlIndented(level: 1))
        """

    static let imageSize = SwaggerSchemaMetadata(
        description: "Image width and height in pixels.",
        isReadOnly: true,
        example: SwaggerEmbeddedExampleSeeds.imageSize
    )
}
