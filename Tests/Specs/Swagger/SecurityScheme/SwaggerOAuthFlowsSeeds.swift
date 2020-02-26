import Foundation
import SwaggerKit

enum SwaggerOAuthFlowsSeeds {

    // MARK: - Type Properties

    static let implicitOnlyYAML = """
        implicit:
        \(SwaggerOAuthImplicitFlowSeeds.readWriteAppsYAML.yamlIndented(level: 1))
        """

    static let implicitOnly = SwaggerOAuthFlows(implicit: SwaggerOAuthImplicitFlowSeeds.readWriteApps)

    static let catchallYAML = """
        authorizationCode:
        \(SwaggerOAuthAuthorizationCodeFlowSeeds.readWriteAppsYAML.yamlIndented(level: 1))
        implicit:
        \(SwaggerOAuthImplicitFlowSeeds.noScopesYAML.yamlIndented(level: 1))
        clientCredentials:
        \(SwaggerOAuthFlowSeeds.readWriteAppsYAML.yamlIndented(level: 1))
        password:
        \(SwaggerOAuthFlowSeeds.noScopesYAML.yamlIndented(level: 1))
        x-private: true
        """

    static let catchall = SwaggerOAuthFlows(
        authorizationCode: SwaggerOAuthAuthorizationCodeFlowSeeds.readWriteApps,
        implicit: SwaggerOAuthImplicitFlowSeeds.noScopes,
        clientCredentials: SwaggerOAuthFlowSeeds.readWriteApps,
        password: SwaggerOAuthFlowSeeds.noScopes,
        extensions: ["private": true]
    )
}
