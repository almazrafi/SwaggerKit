import Foundation
import SwaggerKit

enum SwaggerParameterSeeds {

    // MARK: - Type Properties

    static let uidYAML = """
        \(SwaggerParameterSchemaSeeds.uidYAML)
        \(SwaggerParameterMetadataSeeds.uidYAML)
        """

    static let uid = SwaggerParameter(
        serialization: .schema(SwaggerParameterSchemaSeeds.uid),
        metadata: SwaggerParameterMetadataSeeds.uid
    )

    static let emailYAML = """
        \(SwaggerParameterSchemaSeeds.emailYAML)
        \(SwaggerParameterMetadataSeeds.emailYAML)
        """

    static let email = SwaggerParameter(
        serialization: .schema(SwaggerParameterSchemaSeeds.email),
        metadata: SwaggerParameterMetadataSeeds.email
    )

    static let locationYAML = """
        content:
          application/json:
        \(SwaggerMediaTypeSeeds.locationYAML.yamlIndented(level: 2))
        \(SwaggerParameterMetadataSeeds.locationYAML)
        x-private: true
        """

    static let location = SwaggerParameter(
        serialization: .content(["application/json": SwaggerMediaTypeSeeds.location]),
        metadata: SwaggerParameterMetadataSeeds.location,
        extensions: ["private": true]
    )
}
