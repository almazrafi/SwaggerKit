import Foundation
import SwaggerKit

enum SpecLicenseInfoSeeds {

    // MARK: - Type Properties

    static let exampleYAML = """
        name: Apache 2.0
        url: https://www.apache.org/licenses/LICENSE-2.0.html
        x-private: true
        """

    static let example = SpecLicenseInfo(
        name: "Apache 2.0",
        url: URL(string: "https://www.apache.org/licenses/LICENSE-2.0.html")!,
        extensions: ["private": true]
    )
}
