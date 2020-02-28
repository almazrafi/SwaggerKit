import Foundation
import SwaggerKit

enum SpecHeaderMetadataSeeds {

    // MARK: - Type Properties

    static let anyYAML = "{}"
    static let any = SpecHeaderMetadata()

    static let rateLimitLimitYAML = """
        description: The number of allowed requests in the current period.
        """

    static let rateLimitLimit = SpecHeaderMetadata(
        description: "The number of allowed requests in the current period."
    )

    static let uidYAML = """
        description: Unique identifier of the resource.
        required: true
        """

    static let uid = SpecHeaderMetadata(
        description: "Unique identifier of the resource.",
        isRequired: true
    )

    static let emailYAML = """
        deprecated: true
        """

    static let email = SpecHeaderMetadata(isDeprecated: true)

    static let locationYAML = """
        description: Location coordinates for more relevant results.
        deprecated: true
        """

    static let location = SpecHeaderMetadata(
        description: "Location coordinates for more relevant results.",
        isDeprecated: true
    )
}
