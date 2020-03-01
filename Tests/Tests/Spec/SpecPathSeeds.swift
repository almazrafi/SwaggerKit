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
        \(SpecPathOperationSeeds.getAppsYAML.yamlIndented(level: 1))
        post:
        \(SpecPathOperationSeeds.postAppYAML.yamlIndented(level: 1))
        """

    static let apps = SpecPath(
        description: "User authorization is required to execute the methods.",
        servers: [SpecServerSeeds.producation, SpecServerSeeds.staging],
        get: SpecPathOperationSeeds.getApps,
        post: SpecPathOperationSeeds.postApp
    )

    static let appInfoYAML = """
        summary: Apps operations
        parameters:
        \(SpecParameterSeeds.uidYAML.yamlArrayItem())
        get:
        \(SpecPathOperationSeeds.getAppInfoYAML.yamlIndented(level: 1))
        put:
        \(SpecPathOperationSeeds.getAppInfoYAML.yamlIndented(level: 1))
        patch:
        \(SpecPathOperationSeeds.getAppInfoYAML.yamlIndented(level: 1))
        delete:
        \(SpecPathOperationSeeds.getAppInfoYAML.yamlIndented(level: 1))
        x-private: true
        """

    static let appInfo = SpecPath(
        summary: "Apps operations",
        parameters: [SpecComponent(value: SpecParameterSeeds.uid)],
        get: SpecPathOperationSeeds.getAppInfo,
        put: SpecPathOperationSeeds.getAppInfo,
        patch: SpecPathOperationSeeds.getAppInfo,
        delete: SpecPathOperationSeeds.getAppInfo,
        extensions: ["private": true]
    )
}
