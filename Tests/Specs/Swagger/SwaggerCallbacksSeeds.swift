import Foundation
import SwaggerKit

enum SwaggerCallbacksSeeds {

    // MARK: - Type Properties

    static let subscriptionYAML = """
        '{$request.body#/completionURL}':
          post:
            requestBody:
              $ref: '#/components/requestBodies/CompletionCallback'
            responses:
              204:
        \(SwaggerResponseSeeds.emptyYAML.yamlIndented(level: 4))
        '{$request.body#/progressURL}':
          post:
            requestBody:
              $ref: '#/components/requestBodies/ProgressCallback'
            responses:
              204:
        \(SwaggerResponseSeeds.emptyYAML.yamlIndented(level: 4))
        x-private: true
        """

    static let subscription = SwaggerCallbacks(
        paths: [
            "{$request.body#/completionURL}": SwaggerPath(
                post: SwaggerOperation(
                    responses: ["204": SwaggerComponent(value: SwaggerResponseSeeds.empty)],
                    requestBody: SwaggerComponent(referenceURI: "#/components/requestBodies/CompletionCallback")
                )
            ),
            "{$request.body#/progressURL}": SwaggerPath(
                post: SwaggerOperation(
                    responses: ["204": SwaggerComponent(value: SwaggerResponseSeeds.empty)],
                    requestBody: SwaggerComponent(referenceURI: "#/components/requestBodies/ProgressCallback")
                )
            )
        ],
        extensions: ["private": true]
    )
}
