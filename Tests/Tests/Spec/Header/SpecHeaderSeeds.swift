import Foundation
import SwaggerKit

enum SpecHeaderSeeds {

    // MARK: - Type Properties

    static let rateLimitLimitYAML = """
        \(SpecHeaderSchemaSeeds.rateLimitLimitYAML)
        \(SpecHeaderMetadataSeeds.rateLimitLimitYAML)
        """

    static let rateLimitLimit = SpecHeader(
        serialization: .schema(SpecHeaderSchemaSeeds.rateLimitLimit),
        metadata: SpecHeaderMetadataSeeds.rateLimitLimit
    )

    static let uidYAML = """
        \(SpecHeaderSchemaSeeds.uidYAML)
        \(SpecHeaderMetadataSeeds.uidYAML)
        """

    static let uid = SpecHeader(
        serialization: .schema(SpecHeaderSchemaSeeds.uid),
        metadata: SpecHeaderMetadataSeeds.uid
    )

    static let emailYAML = """
        \(SpecHeaderSchemaSeeds.emailYAML)
        \(SpecHeaderMetadataSeeds.emailYAML)
        """

    static let email = SpecHeader(
        serialization: .schema(SpecHeaderSchemaSeeds.email),
        metadata: SpecHeaderMetadataSeeds.email
    )

    static let locationYAML = """
        content:
          application/json:
        \(SpecMediaTypeSeeds.locationYAML.yamlIndented(level: 2))
        \(SpecHeaderMetadataSeeds.locationYAML)
        x-private: true
        """

    static let location = SpecHeader(
        serialization: .content(["application/json": SpecMediaTypeSeeds.location]),
        metadata: SpecHeaderMetadataSeeds.location,
        extensions: ["private": true]
    )
}
