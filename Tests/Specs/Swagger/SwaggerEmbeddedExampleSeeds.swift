import Foundation
import SwaggerKit

enum SwaggerEmbeddedExampleSeeds {

    // MARK: - Type Properties

    static let videoDurationYAML = "12"
    static let videoDuration = SwaggerEmbeddedExample(12)

    static let uidYAML = "123456"
    static let uid = SwaggerEmbeddedExample(123_456)

    static let ratingYAML = "4.5"
    static let rating = SwaggerEmbeddedExample(4.5)

    static let emailYAML = "user@example.com"
    static let email = SwaggerEmbeddedExample("user@example.com")

    static let languagesYAML = """
        - en
        - ru
        - fr
        """

    static let languages = SwaggerEmbeddedExample(["en", "ru", "fr"])

    static let imageSizeYAML = """
        width: 1200
        height: 800
        """

    static let imageSize = SwaggerEmbeddedExample(["width": 1200, "height": 800])
}
