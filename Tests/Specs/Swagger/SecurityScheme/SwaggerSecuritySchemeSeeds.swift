import Foundation
import SwaggerKit

enum SwaggerSecuritySchemeSeeds {

    // MARK: - Type Properties

    static let invalidTypeYAML = """
        type: http2
        description: HTTP2 authentication
        """

    static let apiKeyYAML = """
        type: apiKey
        name: X-API-Key
        in: header
        description: API Key authentication
        """

    static let apiKey = SwaggerSecurityScheme(
        type: .apiKey(name: "X-API-Key", in: .header),
        description: "API Key authentication"
    )

    static let oauth2YAML = """
        type: oauth2
        flows:
        \(SwaggerOAuthFlowsSeeds.catchallYAML.yamlIndented(level: 1))
        description: OAuth 2.0 authentication
        """

    static let oauth2 = SwaggerSecurityScheme(
        type: .oauth2(flows: SwaggerOAuthFlowsSeeds.catchall),
        description: "OAuth 2.0 authentication"
    )

    static let basicYAML = """
        type: http
        scheme: basic
        description: Basic authentication
        """

    static let basic = SwaggerSecurityScheme(
        type: .http(scheme: .basic),
        description: "Basic authentication"
    )

    static let bearerYAML = """
        type: http
        scheme: bearer
        bearerFormat: JWT
        description: Bearer authentication
        """

    static let bearer = SwaggerSecurityScheme(
        type: .http(scheme: .bearer(format: "JWT")),
        description: "Bearer authentication"
    )

    static let digestYAML = """
        type: http
        scheme: digest
        description: Digest authentication
        """

    static let digest = SwaggerSecurityScheme(
        type: .http(scheme: .other("digest")),
        description: "Digest authentication"
    )

    static let openIDConnectYAML = """
        type: openIdConnect
        openIdConnectUrl: https://example.com/.well-known/openid-configuration
        description: OpenID Connect authentication
        x-private: true
        """

    static let openIDConnect = SwaggerSecurityScheme(
        type: .openIDConnect(url: URL(string: "https://example.com/.well-known/openid-configuration")!),
        description: "OpenID Connect authentication",
        extensions: ["private": true]
    )
}
