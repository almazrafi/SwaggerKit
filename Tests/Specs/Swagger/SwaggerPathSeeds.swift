import Foundation
import SwaggerKit

enum SwaggerPathSeeds {

    // MARK: - Type Properties

    static let emptyYAML = "{}"
    static let empty = SwaggerPath()

    static let appsYAML = """
        description: User authorization is required to execute the methods.
        servers:
        \(SwaggerServerSeeds.producationYAML.yamlArrayItem())
        \(SwaggerServerSeeds.stagingYAML.yamlArrayItem())
        get:
        \(SwaggerOperationSeeds.getAppsYAML.yamlIndented(level: 1))
        post:
        \(SwaggerOperationSeeds.postAppYAML.yamlIndented(level: 1))
        """

    static let apps = SwaggerPath(
        description: "User authorization is required to execute the methods.",
        servers: [SwaggerServerSeeds.producation, SwaggerServerSeeds.staging],
        get: SwaggerOperationSeeds.getApps,
        post: SwaggerOperationSeeds.postApp
    )

    static let appInfoYAML = """
        summary: Apps operations
        parameters:
        \(SwaggerParameterSeeds.uidYAML.yamlArrayItem())
        get:
        \(SwaggerOperationSeeds.getAppInfoYAML.yamlIndented(level: 1))
        put:
        \(SwaggerOperationSeeds.getAppInfoYAML.yamlIndented(level: 1))
        patch:
        \(SwaggerOperationSeeds.getAppInfoYAML.yamlIndented(level: 1))
        delete:
        \(SwaggerOperationSeeds.getAppInfoYAML.yamlIndented(level: 1))
        x-private: true
        """

    static let appInfo = SwaggerPath(
        summary: "Apps operations",
        parameters: [SwaggerComponent(value: SwaggerParameterSeeds.uid)],
        get: SwaggerOperationSeeds.getAppInfo,
        put: SwaggerOperationSeeds.getAppInfo,
        patch: SwaggerOperationSeeds.getAppInfo,
        delete: SwaggerOperationSeeds.getAppInfo,
        extensions: ["private": true]
    )
}
