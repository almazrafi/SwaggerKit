import Foundation
import SwaggerKit

enum SwaggerRequestBodySeeds {

    // MARK: - Type Properties

    static let languagesYAML = """
        content:
          application/json:
        \(SwaggerRequestBodyMediaTypeSeeds.languagesYAML.yamlIndented(level: 2))
        description: List of localization languages represented as ISO 639-1 codes.
        required: true
        """

    static let languages = SwaggerRequestBody(
        content: ["application/json": SwaggerRequestBodyMediaTypeSeeds.languages],
        description: "List of localization languages represented as ISO 639-1 codes.",
        isRequired: true
    )

    static let imageFileYAML = """
        content:
          multipart/form-data:
        \(SwaggerRequestBodyMediaTypeSeeds.imageFileYAML.yamlIndented(level: 2))
        """

    static let imageFile = SwaggerRequestBody(
        content: ["multipart/form-data": SwaggerRequestBodyMediaTypeSeeds.imageFile]
    )

    static let appInfoYAML = """
        content:
          application/json:
        \(SwaggerRequestBodyMediaTypeSeeds.appInfoYAML.yamlIndented(level: 2))
        required: true
        x-private: true
        """

    static let appInfo = SwaggerRequestBody(
        content: ["application/json": SwaggerRequestBodyMediaTypeSeeds.appInfo],
        isRequired: true,
        extensions: ["private": true]
    )
}
