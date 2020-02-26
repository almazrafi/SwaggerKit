import Foundation
import SwaggerKit

enum SwaggerParameterMetadataSeeds {

    // MARK: - Type Properties

    static let uidYAML = """
        in: path
        name: uid
        required: true
        """

    static let uid = SwaggerParameterMetadata(
        type: .path,
        name: "uid",
        isRequired: true
    )

    static let emailYAML = """
        in: header
        name: email
        deprecated: true
        """

    static let email = SwaggerParameterMetadata(
        type: .header,
        name: "email",
        isDeprecated: true
    )

    static let locationYAML = """
        in: query
        name: location
        description: Location coordinates for more relevant results.
        """

    static let location = SwaggerParameterMetadata(
        type: .query,
        name: "location",
        description: "Location coordinates for more relevant results."
    )
}
