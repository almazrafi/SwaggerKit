import Foundation
import SwaggerKit

enum SwaggerServerSeeds {

    // MARK: - Type Properties

    static let deprecatedYAML = "url: https://example.com/api/v1"
    static let deprecated = SwaggerServer(url: "https://example.com/api/v1")

    static let producationYAML = """
        url: https://example.com:{port}/api/{path}
        description: The production API server
        variables:
          path:
        \(SwaggerServerVariableSeeds.pathYAML.yamlIndented(level: 2))
          port:
        \(SwaggerServerVariableSeeds.portYAML.yamlIndented(level: 2))
        """

    static let producation = SwaggerServer(
        url: "https://example.com:{port}/api/{path}",
        description: "The production API server",
        variables: [
            "port": SwaggerServerVariableSeeds.port,
            "path": SwaggerServerVariableSeeds.path
        ]
    )

    static let stagingYAML = """
        url: https://staging.example.com/api/
        x-private: true
        """

    static let staging = SwaggerServer(
        url: "https://staging.example.com/api/",
        extensions: ["private": true]
    )
}
