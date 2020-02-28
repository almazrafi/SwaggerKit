import Foundation
import SwaggerKit

enum SpecRequestBodySeeds {

    // MARK: - Type Properties

    static let languagesYAML = """
        content:
          application/json:
        \(SpecRequestBodyMediaTypeSeeds.languagesYAML.yamlIndented(level: 2))
        description: List of localization languages represented as ISO 639-1 codes.
        required: true
        """

    static let languages = SpecRequestBody(
        content: ["application/json": SpecRequestBodyMediaTypeSeeds.languages],
        description: "List of localization languages represented as ISO 639-1 codes.",
        isRequired: true
    )

    static let imageFileYAML = """
        content:
          multipart/form-data:
        \(SpecRequestBodyMediaTypeSeeds.imageFileYAML.yamlIndented(level: 2))
        """

    static let imageFile = SpecRequestBody(
        content: ["multipart/form-data": SpecRequestBodyMediaTypeSeeds.imageFile]
    )

    static let appInfoYAML = """
        content:
          application/json:
        \(SpecRequestBodyMediaTypeSeeds.appInfoYAML.yamlIndented(level: 2))
        required: true
        x-private: true
        """

    static let appInfo = SpecRequestBody(
        content: ["application/json": SpecRequestBodyMediaTypeSeeds.appInfo],
        isRequired: true,
        extensions: ["private": true]
    )
}
