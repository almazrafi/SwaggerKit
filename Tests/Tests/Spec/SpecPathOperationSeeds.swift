import Foundation
import SwaggerKit

enum SpecPathOperationSeeds {

    // MARK: - Type Properties

    static let getAppInfoYAML = """
        responses:
          200:
        \(SpecResponseSeeds.appInfoYAML.yamlIndented(level: 2))
          4XX:
            $ref: '#/components/responses/Error'
        parameters:
        \(SpecParameterSeeds.uidYAML.yamlArrayItem())
        """

    static let getAppInfo = SpecPathOperation(
        responses: [
            "200": SpecComponent(value: SpecResponseSeeds.appInfo),
            "4XX": SpecComponent(referenceURI: "#/components/responses/Error")
        ],
        parameters: [SpecComponent(value: SpecParameterSeeds.uid)]
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
        \(SpecSecurityRequirementSeeds.optionalYAML.yamlArrayItem())
        """

    static let getApps = SpecPathOperation(
        identifier: "getApps",
        summary: "Returns list of apps",
        responses: [
            "200": SpecComponent(referenceURI: "#/components/responses/Apps"),
            "4XX": SpecComponent(referenceURI: "#/components/responses/Error")
        ],
        security: [SpecSecurityRequirementSeeds.optional]
    )

    static let postAppYAML = """
        operationId: postApp
        summary: Creates app with the provided information
        externalDocs:
        \(SpecExternalDocsSeeds.moreInfoYAML.yamlIndented(level: 1))
        responses:
          200:
        \(SpecResponseSeeds.appInfoYAML.yamlIndented(level: 2))
          4XX:
            $ref: '#/components/responses/Error'
        requestBody:
        \(SpecRequestBodySeeds.appInfoYAML.yamlIndented(level: 1))
        security:
        \(SpecSecurityRequirementSeeds.oauth2YAML.yamlArrayItem())
        """

    static let postApp = SpecPathOperation(
        identifier: "postApp",
        summary: "Creates app with the provided information",
        externalDocs: SpecExternalDocsSeeds.moreInfo,
        responses: [
            "200": SpecComponent(value: SpecResponseSeeds.appInfo),
            "4XX": SpecComponent(referenceURI: "#/components/responses/Error")
        ],
        requestBody: SpecComponent(value: SpecRequestBodySeeds.appInfo),
        security: [SpecSecurityRequirementSeeds.oauth2]
    )

    static let postSubscriptionYAML = """
        description: Deprecated method for event subscriptions.
        deprecated: true
        responses:
          200:
        \(SpecResponseSeeds.emptyYAML.yamlIndented(level: 2))
        requestBody:
          $ref: '#/components/requestBodies/Subscription'
        callbacks:
          event:
        \(SpecCallbacksSeeds.subscriptionYAML.yamlIndented(level: 2))
        servers:
        \(SpecServerSeeds.deprecatedYAML.yamlArrayItem())
        tags:
        - subscriptions
        - private
        x-private: true
        """

    static let postSubscription = SpecPathOperation(
        description: "Deprecated method for event subscriptions.",
        isDeprecated: true,
        responses: ["200": SpecComponent(value: SpecResponseSeeds.empty)],
        requestBody: SpecComponent(referenceURI: "#/components/requestBodies/Subscription"),
        callbacks: ["event": SpecComponent(value: SpecCallbacksSeeds.subscription)],
        tags: ["subscriptions", "private"],
        servers: [SpecServerSeeds.deprecated],
        extensions: ["private": true]
    )
}
