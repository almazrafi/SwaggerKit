import Foundation
import SwaggerKit

enum SpecEmbeddedExampleSeeds {

    // MARK: - Type Properties

    static let videoDurationYAML = "12"
    static let videoDuration = SpecEmbeddedExample(12)

    static let uidYAML = "123456"
    static let uid = SpecEmbeddedExample(123_456)

    static let ratingYAML = "4.5"
    static let rating = SpecEmbeddedExample(4.5)

    static let emailYAML = "user@example.com"
    static let email = SpecEmbeddedExample("user@example.com")

    static let languagesYAML = """
        - en
        - ru
        - fr
        """

    static let languages = SpecEmbeddedExample(["en", "ru", "fr"])

    static let imageSizeYAML = """
        width: 1200
        height: 800
        """

    static let imageSize = SpecEmbeddedExample(["width": 1200, "height": 800])
}
