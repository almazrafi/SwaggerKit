import Foundation
import SwaggerKit

enum SpecCallbacksSeeds {

    // MARK: - Type Properties

    static let subscriptionYAML = """
        '{$request.body#/completionURL}':
          post:
            requestBody:
              $ref: '#/components/requestBodies/CompletionCallback'
            responses:
              204:
        \(SpecResponseSeeds.emptyYAML.yamlIndented(level: 4))
        '{$request.body#/progressURL}':
          post:
            requestBody:
              $ref: '#/components/requestBodies/ProgressCallback'
            responses:
              204:
        \(SpecResponseSeeds.emptyYAML.yamlIndented(level: 4))
        x-private: true
        """

    static let subscription = SpecCallbacks(
        paths: [
            "{$request.body#/completionURL}": SpecPath(
                post: SpecOperation(
                    responses: ["204": SpecComponent(value: SpecResponseSeeds.empty)],
                    requestBody: SpecComponent(referenceURI: "#/components/requestBodies/CompletionCallback")
                )
            ),
            "{$request.body#/progressURL}": SpecPath(
                post: SpecOperation(
                    responses: ["204": SpecComponent(value: SpecResponseSeeds.empty)],
                    requestBody: SpecComponent(referenceURI: "#/components/requestBodies/ProgressCallback")
                )
            )
        ],
        extensions: ["private": true]
    )
}
