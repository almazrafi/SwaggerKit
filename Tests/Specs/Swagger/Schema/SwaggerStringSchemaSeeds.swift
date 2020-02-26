import Foundation
import SwaggerKit

enum SwaggerStringSchemaSeeds {

    // MARK: - Type Properties

    static let anyYAML = "{}"
    static let any = SwaggerStringSchema()

    static let emailYAML = """
        format: email
        pattern: ^\\S+@\\S+\\.\\S+$
        minLength: 4
        maxLength: 256
        """

    static let email = SwaggerStringSchema(
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

    static let mediaType = SwaggerStringSchema(
        defaultValue: "image",
        enumeration: ["image", "video"]
    )

    static let dataYAML = "format: binary"
    static let data = SwaggerStringSchema(format: .binary)
}
