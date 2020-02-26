import Foundation
import SwaggerKit

enum SwaggerHeaderMetadataSeeds {

    // MARK: - Type Properties

    static let anyYAML = "{}"
    static let any = SwaggerHeaderMetadata()

    static let rateLimitLimitYAML = """
        description: The number of allowed requests in the current period.
        """

    static let rateLimitLimit = SwaggerHeaderMetadata(
        description: "The number of allowed requests in the current period."
    )

    static let uidYAML = """
        description: Unique identifier of the resource.
        required: true
        """

    static let uid = SwaggerHeaderMetadata(
        description: "Unique identifier of the resource.",
        isRequired: true
    )

    static let emailYAML = """
        deprecated: true
        """

    static let email = SwaggerHeaderMetadata(isDeprecated: true)

    static let locationYAML = """
        description: Location coordinates for more relevant results.
        deprecated: true
        """

    static let location = SwaggerHeaderMetadata(
        description: "Location coordinates for more relevant results.",
        isDeprecated: true
    )
}
