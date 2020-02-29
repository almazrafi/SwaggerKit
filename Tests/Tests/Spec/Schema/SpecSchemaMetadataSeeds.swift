import Foundation
import SwaggerKit

enum SpecSchemaMetadataSeeds {

    // MARK: - Type Properties

    static let anyYAML = "{}"
    static let any = SpecSchemaMetadata()

    static let availabilityYAML = """
        description: Is the app available for download?
        writeOnly: true
        """

    static let availability = SpecSchemaMetadata(
        description: "Is the app available for download?",
        isWriteOnly: true
    )

    static let videoDurationYAML = """
        description: Video duration in seconds.
        readOnly: true
        deprecated: true
        example: \(SpecEmbeddedExampleSeeds.videoDurationYAML)
        """

    static let videoDuration = SpecSchemaMetadata(
        description: "Video duration in seconds.",
        isReadOnly: true,
        isDeprecated: true,
        example: SpecEmbeddedExampleSeeds.videoDuration
    )

    static let uidYAML = """
        description: Unique identifier of the resource.
        xml:
        \(SpecSchemaXMLSeeds.attributeYAML.yamlIndented(level: 1))
        readOnly: true
        example: \(SpecEmbeddedExampleSeeds.uidYAML)
        """

    static let uid = SpecSchemaMetadata(
        description: "Unique identifier of the resource.",
        xml: SpecSchemaXMLSeeds.attribute,
        isReadOnly: true,
        example: SpecEmbeddedExampleSeeds.uid
    )

    static let ratingYAML = """
        title: Rating
        externalDocs:
        \(SpecExternalDocumentationSeeds.moreInfoYAML.yamlIndented(level: 1))
        readOnly: true
        """

    static let rating = SpecSchemaMetadata(
        title: "Rating",
        externalDocumentation: SpecExternalDocumentationSeeds.moreInfo,
        isReadOnly: true
    )

    static let emailYAML = """
        title: Email
        nullable: true
        example: \(SpecEmbeddedExampleSeeds.emailYAML)
        """

    static let email = SpecSchemaMetadata(
        title: "Email",
        isNullable: true,
        example: SpecEmbeddedExampleSeeds.email
    )

    static let languagesYAML = """
        description: List of localization languages represented as ISO 639-1 codes.
        example:
        \(SpecEmbeddedExampleSeeds.languagesYAML)
        """

    static let languages = SpecSchemaMetadata(
        description: "List of localization languages represented as ISO 639-1 codes.",
        example: SpecEmbeddedExampleSeeds.languages
    )

    static let imageSizeYAML = """
        description: Image width and height in pixels.
        readOnly: true
        example:
        \(SpecEmbeddedExampleSeeds.imageSizeYAML.yamlIndented(level: 1))
        """

    static let imageSize = SpecSchemaMetadata(
        description: "Image width and height in pixels.",
        isReadOnly: true,
        example: SpecEmbeddedExampleSeeds.imageSize
    )
}
