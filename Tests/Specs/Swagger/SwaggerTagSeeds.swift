import Foundation
import SwaggerKit

enum SwaggerTagSeeds {

    // MARK: - Type Properties

    static let anyYAML = "name: any"
    static let any = SwaggerTag(name: "any")

    static let privateYAML = """
        name: Private
        description: Private methods. Can only be used by internal clients.
        externalDocs:
        \(SwaggerExternalDocumentationSeeds.moreInfoYAML.yamlIndented(level: 1))
        x-private: true
        """

    static let `private` = SwaggerTag(
        name: "Private",
        description: "Private methods. Can only be used by internal clients.",
        externalDocumentation: SwaggerExternalDocumentationSeeds.moreInfo,
        extensions: ["private": true]
    )
}
