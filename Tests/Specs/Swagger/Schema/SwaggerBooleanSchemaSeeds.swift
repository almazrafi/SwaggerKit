import Foundation
import SwaggerKit

enum SwaggerBooleanSchemaSeeds {

    // MARK: - Type Properties

    static let anyYAML = "{}"
    static let any = SwaggerBooleanSchema()

    static let availabilityYAML = "default: true"
    static let availability = SwaggerBooleanSchema(defaultValue: true)
}
