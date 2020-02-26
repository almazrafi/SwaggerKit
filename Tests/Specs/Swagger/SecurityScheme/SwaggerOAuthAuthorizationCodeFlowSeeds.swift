import Foundation
import SwaggerKit

enum SwaggerOAuthAuthorizationCodeFlowSeeds {

    // MARK: - Type Properties

    static let noScopesYAML = """
        authorizationUrl: https://example.com/oauth/authorize
        tokenUrl: https://example.com/oauth/token
        scopes: {}
        """

    static let noScopes = SwaggerOAuthAuthorizationCodeFlow(
        authorizationURL: URL(string: "https://example.com/oauth/authorize")!,
        tokenURL: URL(string: "https://example.com/oauth/token")!,
        scopes: [:]
    )

    static let readWriteAppsYAML = """
        authorizationUrl: https://example.com/oauth/authorize
        tokenUrl: https://example.com/oauth/token
        refreshUrl: https://example.com/oauth/token
        scopes:
          apps:read: Read app information
          apps:write: Modify app information
        x-private: true
        """

    static let readWriteApps = SwaggerOAuthAuthorizationCodeFlow(
        authorizationURL: URL(string: "https://example.com/oauth/authorize")!,
        tokenURL: URL(string: "https://example.com/oauth/token")!,
        refreshURL: URL(string: "https://example.com/oauth/token")!,
        scopes: [
            "apps:read": "Read app information",
            "apps:write": "Modify app information"
        ],
        extensions: ["private": true]
    )
}
