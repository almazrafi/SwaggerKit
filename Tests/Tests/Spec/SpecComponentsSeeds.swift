import Foundation
import SwaggerKit

enum SpecComponentsSeeds {

    // MARK: - Type Properties

    static let emptyYAML = "{}"
    static let empty = SpecComponents()

    static let appStoreYAML = """
        securitySchemes:
          OAuth2:
        \(SpecSecuritySchemeSeeds.oauth2YAML.yamlIndented(level: 2))
          Basic:
        \(SpecSecuritySchemeSeeds.basicYAML.yamlIndented(level: 2))
        schemas:
          UID:
        \(SpecSchemaSeeds.uidYAML.yamlIndented(level: 2))
          Email:
        \(SpecSchemaSeeds.emailYAML.yamlIndented(level: 2))
        headers:
          RateLimitLimit:
        \(SpecHeaderSeeds.rateLimitLimitYAML.yamlIndented(level: 2))
          RateLimitRemaining:
            $ref: '../Components/Header/RateLimitRemaining.yml'
        parameters:
          Location:
        \(SpecParameterSeeds.locationYAML.yamlIndented(level: 2))
        requestBodies:
          Languages:
        \(SpecRequestBodySeeds.languagesYAML.yamlIndented(level: 2))
          AppInfo:
        \(SpecRequestBodySeeds.appInfoYAML.yamlIndented(level: 2))
        responses:
          Email:
        \(SpecResponseSeeds.emailYAML.yamlIndented(level: 2))
          AppInfo:
        \(SpecResponseSeeds.appInfoYAML.yamlIndented(level: 2))
        callbacks:
          Subscription:
        \(SpecCallbacksSeeds.subscriptionYAML.yamlIndented(level: 2))
        examples:
          UID:
        \(SpecExampleSeeds.uidYAML.yamlIndented(level: 2))
          Email:
        \(SpecExampleSeeds.emailYAML.yamlIndented(level: 2))
        x-private: true
        """

    static let appStore = SpecComponents(
        securitySchemes: [
            "OAuth2": SpecComponent(value: SpecSecuritySchemeSeeds.oauth2),
            "Basic": SpecComponent(value: SpecSecuritySchemeSeeds.basic)
        ],
        schemas: [
            "UID": SpecComponent(value: SpecSchemaSeeds.uid),
            "Email": SpecComponent(value: SpecSchemaSeeds.email)
        ],
        headers: [
            "RateLimitLimit": SpecComponent(value: SpecHeaderSeeds.rateLimitLimit),
            "RateLimitRemaining": SpecComponent(referenceURI: "../Components/Header/RateLimitRemaining.yml")
        ],
        parameters: ["Location": SpecComponent(value: SpecParameterSeeds.location)],
        requestBodies: [
            "Languages": SpecComponent(value: SpecRequestBodySeeds.languages),
            "AppInfo": SpecComponent(value: SpecRequestBodySeeds.appInfo)
        ],
        responses: [
            "Email": SpecComponent(value: SpecResponseSeeds.email),
            "AppInfo": SpecComponent(value: SpecResponseSeeds.appInfo)
        ],
        callbacks: ["Subscription": SpecComponent(value: SpecCallbacksSeeds.subscription)],
        examples: [
            "UID": SpecComponent(value: SpecExampleSeeds.uid),
            "Email": SpecComponent(value: SpecExampleSeeds.email)
        ],
        extensions: ["private": true]
    )
}
