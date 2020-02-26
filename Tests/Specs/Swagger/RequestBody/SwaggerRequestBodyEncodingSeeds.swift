import Foundation
import SwaggerKit

enum SwaggerRequestBodyEncodingSeeds {

    // MARK: - Type Properties

    static let anyYAML = "{}"
    static let any = SwaggerRequestBodyEncoding()

    static let languagesYAML = """
        style: pipeDelimited
        explode: true
        allowReserved: true
        """

    static let languages = SwaggerRequestBodyEncoding(
        style: .pipeDelimited,
        isExploded: true,
        isAllowedReserved: true
    )

    static let imageFileYAML = """
        contentType: image/png, image/jpeg
        headers:
          X-Rate-Limit-Limit:
        \(SwaggerHeaderSeeds.rateLimitLimitYAML.yamlIndented(level: 2))
        """

    static let imageFile = SwaggerRequestBodyEncoding(
        contentType: "image/png, image/jpeg",
        headers: ["X-Rate-Limit-Limit": SwaggerComponent(value: SwaggerHeaderSeeds.rateLimitLimit)]
    )

    static let appInfoYAML = """
        style: deepObject
        x-private: true
        """

    static let appInfo = SwaggerRequestBodyEncoding(
        style: .deepObject,
        extensions: ["private": true]
    )
}
