import Foundation
import SwaggerKit

enum SwaggerResponseSeeds {

    // MARK: - Type Properties

    static let emptyYAML = "description: Empty response"
    static let empty = SwaggerResponse(description: "Empty response")

    static let emailYAML = """
        description: Email
        headers:
          X-Rate-Limit-Limit:
        \(SwaggerHeaderSeeds.rateLimitLimitYAML.yamlIndented(level: 2))
          X-Rate-Limit-Remaining:
            $ref: '#/components/headers/RateLimitRemaining'
        content:
          text/plain:
        \(SwaggerMediaTypeSeeds.emailYAML.yamlIndented(level: 2))
        """

    static let email = SwaggerResponse(
        description: "Email",
        headers: [
            "X-Rate-Limit-Limit": SwaggerComponent(value: SwaggerHeaderSeeds.rateLimitLimit),
            "X-Rate-Limit-Remaining": SwaggerComponent(referenceURI: "#/components/headers/RateLimitRemaining")
        ],
        content: ["text/plain": SwaggerMediaTypeSeeds.email]
    )

    static let appInfoYAML = """
        description: App info
        content:
          application/json:
        \(SwaggerMediaTypeSeeds.appInfoYAML.yamlIndented(level: 2))
        links:
          languages:
            operationId: getAppLanguages
            parameters:
              uid: $request.path.uid
        x-private: true
        """

    static let appInfo = SwaggerResponse(
        description: "App info",
        content: ["application/json": SwaggerMediaTypeSeeds.appInfo],
        rawLinks: [
            "languages": [
                "operationId": "getAppLanguages",
                "parameters": ["uid": "$request.path.uid"]
            ]
        ],
        extensions: ["private": true]
    )
}
