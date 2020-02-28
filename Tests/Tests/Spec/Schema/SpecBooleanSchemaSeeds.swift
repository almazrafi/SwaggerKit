import Foundation
import SwaggerKit

enum SpecBooleanSchemaSeeds {

    // MARK: - Type Properties

    static let anyYAML = "{}"
    static let any = SpecBooleanSchema()

    static let availabilityYAML = "default: true"
    static let availability = SpecBooleanSchema(defaultValue: true)
}
