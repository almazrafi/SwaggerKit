import Foundation
import SwaggerKit

enum SpecContactInfoSeeds {

    // MARK: - Type Properties

    static let exampleYAML = """
        name: API Support
        email: support@example.com
        url: http://www.example.com/support
        x-private: true
        """

    static let example = SpecContactInfo(
        name: "API Support",
        email: "support@example.com",
        url: URL(string: "http://www.example.com/support")!,
        extensions: ["private": true]
    )
}
