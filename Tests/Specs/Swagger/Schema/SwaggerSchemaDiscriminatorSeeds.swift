import Foundation
import SwaggerKit

enum SwaggerSchemaDiscriminatorSeeds {

        // MARK: - Type Properties

    static let mediaTypeYAML = """
        propertyName: mediaType
        mapping:
          photo: Photo
          video: Video
        x-private: true
        """

    static let mediaType = SwaggerSchemaDiscriminator(
        propertyName: "mediaType",
        mapping: [
            "photo": SwaggerReference(uri: "Photo"),
            "video": SwaggerReference(uri: "Video")
        ],
        extensions: ["private": true]
    )
}
