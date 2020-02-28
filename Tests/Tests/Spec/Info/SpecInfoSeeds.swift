import Foundation
import SwaggerKit

enum SpecInfoSeeds {

    // MARK: - Type Properties

    static let exampleYAML = """
        title: API Example
        version: 1.2.3
        description: This is an example specification for tests of SwaggerKit framework.
        termsOfService: http://example.com/terms/
        contact:
        \(SpecContactInfoSeeds.exampleYAML.yamlIndented(level: 1))
        license:
        \(SpecLicenseInfoSeeds.exampleYAML.yamlIndented(level: 1))
        x-private: true
        """

    static let example = SpecInfo(
        title: "API Example",
        version: SpecVersion(major: 1, minor: 2, patch: 3),
        description: "This is an example specification for tests of SwaggerKit framework.",
        termsOfServiceURL: URL(string: "http://example.com/terms/")!,
        contact: SpecContactInfoSeeds.example,
        license: SpecLicenseInfoSeeds.example,
        extensions: ["private": true]
    )
}
