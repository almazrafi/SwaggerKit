import Foundation
import SwaggerKit

enum SpecOAuthFlowsSeeds {

    // MARK: - Type Properties

    static let implicitOnlyYAML = """
        implicit:
        \(SpecOAuthImplicitFlowSeeds.readWriteAppsYAML.yamlIndented(level: 1))
        """

    static let implicitOnly = SpecOAuthFlows(implicit: SpecOAuthImplicitFlowSeeds.readWriteApps)

    static let catchallYAML = """
        authorizationCode:
        \(SpecOAuthAuthorizationCodeFlowSeeds.readWriteAppsYAML.yamlIndented(level: 1))
        implicit:
        \(SpecOAuthImplicitFlowSeeds.noScopesYAML.yamlIndented(level: 1))
        clientCredentials:
        \(SpecOAuthFlowSeeds.readWriteAppsYAML.yamlIndented(level: 1))
        password:
        \(SpecOAuthFlowSeeds.noScopesYAML.yamlIndented(level: 1))
        x-private: true
        """

    static let catchall = SpecOAuthFlows(
        authorizationCode: SpecOAuthAuthorizationCodeFlowSeeds.readWriteApps,
        implicit: SpecOAuthImplicitFlowSeeds.noScopes,
        clientCredentials: SpecOAuthFlowSeeds.readWriteApps,
        password: SpecOAuthFlowSeeds.noScopes,
        extensions: ["private": true]
    )
}
