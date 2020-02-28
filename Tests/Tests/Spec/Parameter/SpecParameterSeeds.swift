import Foundation
import SwaggerKit

enum SpecParameterSeeds {

    // MARK: - Type Properties

    static let uidYAML = """
        \(SpecParameterSchemaSeeds.uidYAML)
        \(SpecParameterMetadataSeeds.uidYAML)
        """

    static let uid = SpecParameter(
        serialization: .schema(SpecParameterSchemaSeeds.uid),
        metadata: SpecParameterMetadataSeeds.uid
    )

    static let emailYAML = """
        \(SpecParameterSchemaSeeds.emailYAML)
        \(SpecParameterMetadataSeeds.emailYAML)
        """

    static let email = SpecParameter(
        serialization: .schema(SpecParameterSchemaSeeds.email),
        metadata: SpecParameterMetadataSeeds.email
    )

    static let locationYAML = """
        content:
          application/json:
        \(SpecMediaTypeSeeds.locationYAML.yamlIndented(level: 2))
        \(SpecParameterMetadataSeeds.locationYAML)
        x-private: true
        """

    static let location = SpecParameter(
        serialization: .content(["application/json": SpecMediaTypeSeeds.location]),
        metadata: SpecParameterMetadataSeeds.location,
        extensions: ["private": true]
    )
}
