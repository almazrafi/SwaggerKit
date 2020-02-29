import Foundation
import SwaggerKit

enum SpecTagSeeds {

    // MARK: - Type Properties

    static let anyYAML = "name: any"
    static let any = SpecTag(name: "any")

    static let privateYAML = """
        name: Private
        description: Private methods. Can only be used by internal clients.
        externalDocs:
        \(SpecExternalDocsSeeds.moreInfoYAML.yamlIndented(level: 1))
        x-private: true
        """

    static let `private` = SpecTag(
        name: "Private",
        description: "Private methods. Can only be used by internal clients.",
        externalDocs: SpecExternalDocsSeeds.moreInfo,
        extensions: ["private": true]
    )
}
