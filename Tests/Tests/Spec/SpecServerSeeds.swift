import Foundation
import SwaggerKit

enum SpecServerSeeds {

    // MARK: - Type Properties

    static let deprecatedYAML = "url: https://example.com/api/v1"
    static let deprecated = SpecServer(url: "https://example.com/api/v1")

    static let producationYAML = """
        url: https://example.com:{port}/api/{path}
        description: The production API server
        variables:
          path:
        \(SpecServerVariableSeeds.pathYAML.yamlIndented(level: 2))
          port:
        \(SpecServerVariableSeeds.portYAML.yamlIndented(level: 2))
        """

    static let producation = SpecServer(
        url: "https://example.com:{port}/api/{path}",
        description: "The production API server",
        variables: [
            "port": SpecServerVariableSeeds.port,
            "path": SpecServerVariableSeeds.path
        ]
    )

    static let stagingYAML = """
        url: https://staging.example.com/api/
        x-private: true
        """

    static let staging = SpecServer(
        url: "https://staging.example.com/api/",
        extensions: ["private": true]
    )
}
