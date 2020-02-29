import Foundation
import SwaggerKit

enum SpecSecurityRequirementSeeds {

    // MARK: - Type Properties

    static let optionalYAML = "{}"
    static let optional = SpecSecurityRequirement()

    static let basicYAML = "Basic: []"

    static let basic = SpecSecurityRequirement(
        name: "Basic",
        scopes: []
    )

    static let oauth2YAML = """
        OAuth2:
        - apps:read
        - apps:write
        """

    static let oauth2 = SpecSecurityRequirement(
        name: "OAuth2",
        scopes: [
            "apps:read",
            "apps:write"
        ]
    )
}
