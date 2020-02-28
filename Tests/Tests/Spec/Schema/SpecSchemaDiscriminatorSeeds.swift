import Foundation
import SwaggerKit

enum SpecSchemaDiscriminatorSeeds {

        // MARK: - Type Properties

    static let mediaTypeYAML = """
        propertyName: mediaType
        mapping:
          photo: Photo
          video: Video
        x-private: true
        """

    static let mediaType = SpecSchemaDiscriminator(
        propertyName: "mediaType",
        mapping: [
            "photo": SpecReference(uri: "Photo"),
            "video": SpecReference(uri: "Video")
        ],
        extensions: ["private": true]
    )
}
