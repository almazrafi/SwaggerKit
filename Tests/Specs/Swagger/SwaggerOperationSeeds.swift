import Foundation
import SwaggerKit

enum SwaggerOperationSeeds {

    // MARK: - Type Properties

    static let getAppInfoYAML = """
        responses:
          200:
        \(SwaggerResponseSeeds.appInfoYAML.yamlIndented(level: 2))
          4XX:
            $ref: '#/components/responses/Error'
        parameters:
        \(SwaggerParameterSeeds.uidYAML.yamlArrayItem())
        """

    static let getAppInfo = SwaggerOperation(
        responses: [
            "200": SwaggerComponent(value: SwaggerResponseSeeds.appInfo),
            "4XX": SwaggerComponent(referenceURI: "#/components/responses/Error")
        ],
        parameters: [SwaggerComponent(value: SwaggerParameterSeeds.uid)]
    )

    static let getAppsYAML = """
        operationId: getApps
        summary: Returns list of apps
        responses:
          200:
            $ref: '#/components/responses/Apps'
          4XX:
            $ref: '#/components/responses/Error'
        security:
        - authorization:
          - apps:read
        """

    static let getApps = SwaggerOperation(
        identifier: "getApps",
        summary: "Returns list of apps",
        responses: [
            "200": SwaggerComponent(referenceURI: "#/components/responses/Apps"),
            "4XX": SwaggerComponent(referenceURI: "#/components/responses/Error")
        ],
        security: [
            "authorization": ["apps:read"]
        ]
    )

    static let postAppYAML = """
        operationId: postApp
        summary: Creates app with the provided information
        externalDocs:
        \(SwaggerExternalDocumentationSeeds.moreInfoYAML.yamlIndented(level: 1))
        responses:
          200:
        \(SwaggerResponseSeeds.appInfoYAML.yamlIndented(level: 2))
          4XX:
            $ref: '#/components/responses/Error'
        requestBody:
        \(SwaggerRequestBodySeeds.appInfoYAML.yamlIndented(level: 1))
        security:
        - authorization:
          - apps:read
          - apps:write
        """

    static let postApp = SwaggerOperation(
        identifier: "postApp",
        summary: "Creates app with the provided information",
        externalDocumentation: SwaggerExternalDocumentationSeeds.moreInfo,
        responses: [
            "200": SwaggerComponent(value: SwaggerResponseSeeds.appInfo),
            "4XX": SwaggerComponent(referenceURI: "#/components/responses/Error")
        ],
        requestBody: SwaggerComponent(value: SwaggerRequestBodySeeds.appInfo),
        security: [
            "authorization": ["apps:read", "apps:write"]
        ]
    )

    static let postSubscriptionYAML = """
        description: Deprecated method for event subscriptions.
        deprecated: true
        responses:
          200:
        \(SwaggerResponseSeeds.emptyYAML.yamlIndented(level: 2))
        requestBody:
          $ref: '#/components/requestBodies/Subscription'
        callbacks:
          event:
        \(SwaggerCallbacksSeeds.subscriptionYAML.yamlIndented(level: 2))
        servers:
        \(SwaggerServerSeeds.deprecatedYAML.yamlArrayItem())
        tags:
        - subscriptions
        - private
        x-private: true
        """

    static let postSubscription = SwaggerOperation(
        description: "Deprecated method for event subscriptions.",
        isDeprecated: true,
        responses: ["200": SwaggerComponent(value: SwaggerResponseSeeds.empty)],
        requestBody: SwaggerComponent(referenceURI: "#/components/requestBodies/Subscription"),
        callbacks: ["event": SwaggerComponent(value: SwaggerCallbacksSeeds.subscription)],
        servers: [SwaggerServerSeeds.deprecated],
        tags: ["subscriptions", "private"],
        extensions: ["private": true]
    )
}
