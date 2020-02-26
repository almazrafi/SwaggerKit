import Foundation
import SwaggerKit

enum SwaggerOAuthImplicitFlowSeeds {

    // MARK: - Type Properties

    static let noScopesYAML = """
        authorizationUrl: https://example.com/oauth/authorize
        scopes: {}
        """

    static let noScopes = SwaggerOAuthImplicitFlow(
        authorizationURL: URL(string: "https://example.com/oauth/authorize")!,
        scopes: [:]
    )

    static let readWriteAppsYAML = """
        authorizationUrl: https://example.com/oauth/authorize
        refreshUrl: https://example.com/oauth/token
        scopes:
          apps:read: Read app information
          apps:write: Modify app information
        x-private: true
        """

    static let readWriteApps = SwaggerOAuthImplicitFlow(
        authorizationURL: URL(string: "https://example.com/oauth/authorize")!,
        refreshURL: URL(string: "https://example.com/oauth/token")!,
        scopes: [
            "apps:read": "Read app information",
            "apps:write": "Modify app information"
        ],
        extensions: ["private": true]
    )
}
