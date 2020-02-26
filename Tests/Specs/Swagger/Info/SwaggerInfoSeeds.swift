import Foundation
import SwaggerKit

enum SwaggerInfoSeeds {

    // MARK: - Type Properties

    static let exampleYAML = """
        title: API Example
        version: 1.2.3
        description: This is an example specification for tests of SwaggerKit framework.
        termsOfService: http://example.com/terms/
        contact:
        \(SwaggerContactInfoSeeds.exampleYAML.yamlIndented(level: 1))
        license:
        \(SwaggerLicenseInfoSeeds.exampleYAML.yamlIndented(level: 1))
        x-private: true
        """

    static let example = SwaggerInfo(
        title: "API Example",
        version: SwaggerVersion(major: 1, minor: 2, patch: 3),
        description: "This is an example specification for tests of SwaggerKit framework.",
        termsOfServiceURL: URL(string: "http://example.com/terms/")!,
        contact: SwaggerContactInfoSeeds.example,
        license: SwaggerLicenseInfoSeeds.example,
        extensions: ["private": true]
    )
}
