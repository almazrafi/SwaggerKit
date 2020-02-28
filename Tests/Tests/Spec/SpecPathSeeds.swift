import Foundation
import SwaggerKit

enum SpecPathSeeds {

    // MARK: - Type Properties

    static let emptyYAML = "{}"
    static let empty = SpecPath()

    static let appsYAML = """
        description: User authorization is required to execute the methods.
        servers:
        \(SpecServerSeeds.producationYAML.yamlArrayItem())
        \(SpecServerSeeds.stagingYAML.yamlArrayItem())
        get:
        \(SpecOperationSeeds.getAppsYAML.yamlIndented(level: 1))
        post:
        \(SpecOperationSeeds.postAppYAML.yamlIndented(level: 1))
        """

    static let apps = SpecPath(
        description: "User authorization is required to execute the methods.",
        servers: [SpecServerSeeds.producation, SpecServerSeeds.staging],
        get: SpecOperationSeeds.getApps,
        post: SpecOperationSeeds.postApp
    )

    static let appInfoYAML = """
        summary: Apps operations
        parameters:
        \(SpecParameterSeeds.uidYAML.yamlArrayItem())
        get:
        \(SpecOperationSeeds.getAppInfoYAML.yamlIndented(level: 1))
        put:
        \(SpecOperationSeeds.getAppInfoYAML.yamlIndented(level: 1))
        patch:
        \(SpecOperationSeeds.getAppInfoYAML.yamlIndented(level: 1))
        delete:
        \(SpecOperationSeeds.getAppInfoYAML.yamlIndented(level: 1))
        x-private: true
        """

    static let appInfo = SpecPath(
        summary: "Apps operations",
        parameters: [SpecComponent(value: SpecParameterSeeds.uid)],
        get: SpecOperationSeeds.getAppInfo,
        put: SpecOperationSeeds.getAppInfo,
        patch: SpecOperationSeeds.getAppInfo,
        delete: SpecOperationSeeds.getAppInfo,
        extensions: ["private": true]
    )
}
