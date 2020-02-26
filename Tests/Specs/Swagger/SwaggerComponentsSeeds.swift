import Foundation
import SwaggerKit

enum SwaggerComponentsSeeds {

    // MARK: - Type Properties

    static let emptyYAML = "{}"
    static let empty = SwaggerComponents()

    static let appStoreYAML = """
        securitySchemes:
          OAuth2:
        \(SwaggerSecuritySchemeSeeds.oauth2YAML.yamlIndented(level: 2))
          Basic:
        \(SwaggerSecuritySchemeSeeds.basicYAML.yamlIndented(level: 2))
        schemas:
          UID:
        \(SwaggerSchemaSeeds.uidYAML.yamlIndented(level: 2))
          Email:
        \(SwaggerSchemaSeeds.emailYAML.yamlIndented(level: 2))
        headers:
          RateLimitLimit:
        \(SwaggerHeaderSeeds.rateLimitLimitYAML.yamlIndented(level: 2))
          RateLimitRemaining:
            $ref: '../Components/Header/RateLimitRemaining.yml'
        parameters:
          Location:
        \(SwaggerParameterSeeds.locationYAML.yamlIndented(level: 2))
        requestBodies:
          Languages:
        \(SwaggerRequestBodySeeds.languagesYAML.yamlIndented(level: 2))
          AppInfo:
        \(SwaggerRequestBodySeeds.appInfoYAML.yamlIndented(level: 2))
        responses:
          Email:
        \(SwaggerResponseSeeds.emailYAML.yamlIndented(level: 2))
          AppInfo:
        \(SwaggerResponseSeeds.appInfoYAML.yamlIndented(level: 2))
        callbacks:
          Subscription:
        \(SwaggerCallbacksSeeds.subscriptionYAML.yamlIndented(level: 2))
        examples:
          UID:
        \(SwaggerExampleSeeds.uidYAML.yamlIndented(level: 2))
          Email:
        \(SwaggerExampleSeeds.emailYAML.yamlIndented(level: 2))
        x-private: true
        """

    static let appStore = SwaggerComponents(
        securitySchemes: [
            "OAuth2": SwaggerComponent(value: SwaggerSecuritySchemeSeeds.oauth2),
            "Basic": SwaggerComponent(value: SwaggerSecuritySchemeSeeds.basic)
        ],
        schemas: [
            "UID": SwaggerComponent(value: SwaggerSchemaSeeds.uid),
            "Email": SwaggerComponent(value: SwaggerSchemaSeeds.email)
        ],
        headers: [
            "RateLimitLimit": SwaggerComponent(value: SwaggerHeaderSeeds.rateLimitLimit),
            "RateLimitRemaining": SwaggerComponent(referenceURI: "../Components/Header/RateLimitRemaining.yml")
        ],
        parameters: ["Location": SwaggerComponent(value: SwaggerParameterSeeds.location)],
        requestBodies: [
            "Languages": SwaggerComponent(value: SwaggerRequestBodySeeds.languages),
            "AppInfo": SwaggerComponent(value: SwaggerRequestBodySeeds.appInfo)
        ],
        responses: [
            "Email": SwaggerComponent(value: SwaggerResponseSeeds.email),
            "AppInfo": SwaggerComponent(value: SwaggerResponseSeeds.appInfo)
        ],
        callbacks: ["Subscription": SwaggerComponent(value: SwaggerCallbacksSeeds.subscription)],
        examples: [
            "UID": SwaggerComponent(value: SwaggerExampleSeeds.uid),
            "Email": SwaggerComponent(value: SwaggerExampleSeeds.email)
        ],
        extensions: ["private": true]
    )
}
