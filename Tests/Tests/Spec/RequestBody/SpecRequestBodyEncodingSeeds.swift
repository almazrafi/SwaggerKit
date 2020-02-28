import Foundation
import SwaggerKit

enum SpecRequestBodyEncodingSeeds {

    // MARK: - Type Properties

    static let anyYAML = "{}"
    static let any = SpecRequestBodyEncoding()

    static let languagesYAML = """
        style: pipeDelimited
        explode: true
        allowReserved: true
        """

    static let languages = SpecRequestBodyEncoding(
        style: .pipeDelimited,
        isExploded: true,
        isAllowedReserved: true
    )

    static let imageFileYAML = """
        contentType: image/png, image/jpeg
        headers:
          X-Rate-Limit-Limit:
        \(SpecHeaderSeeds.rateLimitLimitYAML.yamlIndented(level: 2))
        """

    static let imageFile = SpecRequestBodyEncoding(
        contentType: "image/png, image/jpeg",
        headers: ["X-Rate-Limit-Limit": SpecComponent(value: SpecHeaderSeeds.rateLimitLimit)]
    )

    static let appInfoYAML = """
        style: deepObject
        x-private: true
        """

    static let appInfo = SpecRequestBodyEncoding(
        style: .deepObject,
        extensions: ["private": true]
    )
}
