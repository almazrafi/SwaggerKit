import Foundation
import SwaggerKit

enum SpecExampleSeeds {

    // MARK: - Type Properties

    static let uidYAML = "value: \(SpecEmbeddedExampleSeeds.uidYAML)"
    static let uid = SpecExample(type: .embedded(SpecEmbeddedExampleSeeds.uid))

    static let ratingYAML = """
        value: \(SpecEmbeddedExampleSeeds.ratingYAML)
        description: Rating example.
        """

    static let rating = SpecExample(
        type: .embedded(SpecEmbeddedExampleSeeds.rating),
        description: "Rating example."
    )

    static let emailYAML = """
        value: \(SpecEmbeddedExampleSeeds.emailYAML)
        summary: Email
        description: Email example.
        """

    static let email = SpecExample(
        type: .embedded(SpecEmbeddedExampleSeeds.email),
        summary: "Email",
        description: "Email example."
    )

    static let languagesYAML = """
        value:
        \(SpecEmbeddedExampleSeeds.languagesYAML)
        summary: Languages
        """

    static let languages = SpecExample(
        type: .embedded(SpecEmbeddedExampleSeeds.languages),
        summary: "Languages"
    )

    static let imageSizeYAML = """
        value:
        \(SpecEmbeddedExampleSeeds.imageSizeYAML.yamlIndented(level: 1))
        description: Example of image width and height.
        """

    static let imageSize = SpecExample(
        type: .embedded(SpecEmbeddedExampleSeeds.imageSize),
        description: "Example of image width and height."
    )

    static let imageYAML = """
        externalValue: http://example.org/examples/image.jpg
        summary: Image
        description: JPEG image example.
        x-private: true
        """

    static let image = SpecExample(
        type: .external(URL(string: "http://example.org/examples/image.jpg")!),
        summary: "Image",
        description: "JPEG image example.",
        extensions: ["private": true]
    )
}
