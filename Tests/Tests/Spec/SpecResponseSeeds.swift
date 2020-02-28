import Foundation
import SwaggerKit

enum SpecResponseSeeds {

    // MARK: - Type Properties

    static let emptyYAML = "description: Empty response"
    static let empty = SpecResponse(description: "Empty response")

    static let emailYAML = """
        description: Email
        headers:
          X-Rate-Limit-Limit:
        \(SpecHeaderSeeds.rateLimitLimitYAML.yamlIndented(level: 2))
          X-Rate-Limit-Remaining:
            $ref: '#/components/headers/RateLimitRemaining'
        content:
          text/plain:
        \(SpecMediaTypeSeeds.emailYAML.yamlIndented(level: 2))
        """

    static let email = SpecResponse(
        description: "Email",
        headers: [
            "X-Rate-Limit-Limit": SpecComponent(value: SpecHeaderSeeds.rateLimitLimit),
            "X-Rate-Limit-Remaining": SpecComponent(referenceURI: "#/components/headers/RateLimitRemaining")
        ],
        content: ["text/plain": SpecMediaTypeSeeds.email]
    )

    static let appInfoYAML = """
        description: App info
        content:
          application/json:
        \(SpecMediaTypeSeeds.appInfoYAML.yamlIndented(level: 2))
        links:
          languages:
            operationId: getAppLanguages
            parameters:
              uid: $request.path.uid
        x-private: true
        """

    static let appInfo = SpecResponse(
        description: "App info",
        content: ["application/json": SpecMediaTypeSeeds.appInfo],
        rawLinks: [
            "languages": [
                "operationId": "getAppLanguages",
                "parameters": ["uid": "$request.path.uid"]
            ]
        ],
        extensions: ["private": true]
    )
}
