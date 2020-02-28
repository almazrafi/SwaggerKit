import Foundation
import SwaggerKit

enum SpecParameterMetadataSeeds {

    // MARK: - Type Properties

    static let uidYAML = """
        in: path
        name: uid
        required: true
        """

    static let uid = SpecParameterMetadata(
        type: .path,
        name: "uid",
        isRequired: true
    )

    static let emailYAML = """
        in: header
        name: email
        deprecated: true
        """

    static let email = SpecParameterMetadata(
        type: .header,
        name: "email",
        isDeprecated: true
    )

    static let locationYAML = """
        in: query
        name: location
        description: Location coordinates for more relevant results.
        """

    static let location = SpecParameterMetadata(
        type: .query,
        name: "location",
        description: "Location coordinates for more relevant results."
    )
}
