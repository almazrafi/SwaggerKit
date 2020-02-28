import Foundation
import SwaggerKit

enum SpecStringSchemaSeeds {

    // MARK: - Type Properties

    static let anyYAML = "{}"
    static let any = SpecStringSchema()

    static let emailYAML = """
        format: email
        pattern: ^\\S+@\\S+\\.\\S+$
        minLength: 4
        maxLength: 256
        """

    static let email = SpecStringSchema(
        format: .email,
        pattern: "^\\S+@\\S+\\.\\S+$",
        minLength: 4,
        maxLength: 256
    )

    static let mediaTypeYAML = """
        default: image
        enum:
        - image
        - video
        """

    static let mediaType = SpecStringSchema(
        defaultValue: "image",
        enumeration: ["image", "video"]
    )

    static let dataYAML = "format: binary"
    static let data = SpecStringSchema(format: .binary)
}
