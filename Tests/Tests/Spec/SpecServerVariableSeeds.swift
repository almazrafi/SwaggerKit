import Foundation
import SwaggerKit

enum SpecServerVariableSeeds {

    // MARK: - Type Properties

    static let pathYAML = "default: v2"
    static let path = SpecServerVariable(defaultValue: "v2")

    static let portYAML = """
        default: 8443
        enum:
        - 8443
        - 443
        description: The port can be 8443 or 443.
        x-private: true
        """

    static let port = SpecServerVariable(
        defaultValue: "8443",
        enumeration: ["8443", "443"],
        description: "The port can be 8443 or 443.",
        extensions: ["private": true]
    )
}
