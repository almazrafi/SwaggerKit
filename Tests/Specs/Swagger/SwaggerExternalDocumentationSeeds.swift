import Foundation
import SwaggerKit

enum SwaggerExternalDocumentationSeeds {

    // MARK: - Type Properties

    static let anyYAML = "url: https://example.com/docs"
    static let any = SwaggerExternalDocumentation(url: URL(string: "https://example.com/docs")!)

    static let moreInfoYAML = """
        url: https://example.com/more
        description: Find more info here.
        x-private: true
        """

    static let moreInfo = SwaggerExternalDocumentation(
        url: URL(string: "https://example.com/more")!,
        description: "Find more info here.",
        extensions: ["private": true]
    )
}
