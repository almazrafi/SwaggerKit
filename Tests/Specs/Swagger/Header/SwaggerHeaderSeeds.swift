import Foundation
import SwaggerKit

enum SwaggerHeaderSeeds {

    // MARK: - Type Properties

    static let rateLimitLimitYAML = """
        \(SwaggerHeaderSchemaSeeds.rateLimitLimitYAML)
        \(SwaggerHeaderMetadataSeeds.rateLimitLimitYAML)
        """

    static let rateLimitLimit = SwaggerHeader(
        serialization: .schema(SwaggerHeaderSchemaSeeds.rateLimitLimit),
        metadata: SwaggerHeaderMetadataSeeds.rateLimitLimit
    )

    static let uidYAML = """
        \(SwaggerHeaderSchemaSeeds.uidYAML)
        \(SwaggerHeaderMetadataSeeds.uidYAML)
        """

    static let uid = SwaggerHeader(
        serialization: .schema(SwaggerHeaderSchemaSeeds.uid),
        metadata: SwaggerHeaderMetadataSeeds.uid
    )

    static let emailYAML = """
        \(SwaggerHeaderSchemaSeeds.emailYAML)
        \(SwaggerHeaderMetadataSeeds.emailYAML)
        """

    static let email = SwaggerHeader(
        serialization: .schema(SwaggerHeaderSchemaSeeds.email),
        metadata: SwaggerHeaderMetadataSeeds.email
    )

    static let locationYAML = """
        content:
          application/json:
        \(SwaggerMediaTypeSeeds.locationYAML.yamlIndented(level: 2))
        \(SwaggerHeaderMetadataSeeds.locationYAML)
        x-private: true
        """

    static let location = SwaggerHeader(
        serialization: .content(["application/json": SwaggerMediaTypeSeeds.location]),
        metadata: SwaggerHeaderMetadataSeeds.location,
        extensions: ["private": true]
    )
}
