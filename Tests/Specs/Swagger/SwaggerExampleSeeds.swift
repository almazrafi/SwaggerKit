import Foundation
import SwaggerKit

enum SwaggerExampleSeeds {

    // MARK: - Type Properties

    static let uidYAML = "value: \(SwaggerEmbeddedExampleSeeds.uidYAML)"
    static let uid = SwaggerExample(content: .embedded(SwaggerEmbeddedExampleSeeds.uid))

    static let ratingYAML = """
        value: \(SwaggerEmbeddedExampleSeeds.ratingYAML)
        description: Rating example.
        """

    static let rating = SwaggerExample(
        content: .embedded(SwaggerEmbeddedExampleSeeds.rating),
        description: "Rating example."
    )

    static let emailYAML = """
        value: \(SwaggerEmbeddedExampleSeeds.emailYAML)
        summary: Email
        description: Email example.
        """

    static let email = SwaggerExample(
        content: .embedded(SwaggerEmbeddedExampleSeeds.email),
        summary: "Email",
        description: "Email example."
    )

    static let languagesYAML = """
        value:
        \(SwaggerEmbeddedExampleSeeds.languagesYAML)
        summary: Languages
        """

    static let languages = SwaggerExample(
        content: .embedded(SwaggerEmbeddedExampleSeeds.languages),
        summary: "Languages"
    )

    static let imageSizeYAML = """
        value:
        \(SwaggerEmbeddedExampleSeeds.imageSizeYAML.yamlIndented(level: 1))
        description: Example of image width and height.
        """

    static let imageSize = SwaggerExample(
        content: .embedded(SwaggerEmbeddedExampleSeeds.imageSize),
        description: "Example of image width and height."
    )

    static let imageYAML = """
        externalValue: http://example.org/examples/image.jpg
        summary: Image
        description: JPEG image example.
        x-private: true
        """

    static let image = SwaggerExample(
        content: .external(URL(string: "http://example.org/examples/image.jpg")!),
        summary: "Image",
        description: "JPEG image example.",
        extensions: ["private": true]
    )
}
