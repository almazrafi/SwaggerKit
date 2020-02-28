import Foundation
import SwaggerKit

enum SpecOAuthFlowSeeds {

    // MARK: - Type Properties

    static let noScopesYAML = """
        tokenUrl: https://example.com/oauth/token
        scopes: {}
        """

    static let noScopes = SpecOAuthFlow(
        tokenURL: URL(string: "https://example.com/oauth/token")!,
        scopes: [:]
    )

    static let readWriteAppsYAML = """
        tokenUrl: https://example.com/oauth/token
        refreshUrl: https://example.com/oauth/token
        scopes:
          apps:read: Read app information
          apps:write: Modify app information
        x-private: true
        """

    static let readWriteApps = SpecOAuthFlow(
        tokenURL: URL(string: "https://example.com/oauth/token")!,
        refreshURL: URL(string: "https://example.com/oauth/token")!,
        scopes: [
            "apps:read": "Read app information",
            "apps:write": "Modify app information"
        ],
        extensions: ["private": true]
    )
}
