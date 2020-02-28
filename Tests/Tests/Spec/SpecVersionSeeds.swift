import Foundation
import SwaggerKit

enum SpecVersionSeeds {

    // MARK: - Type Properties

    static let fullDescription = "1.2.3"
    static let fullYAML = "1.2.3"
    static let full = SpecVersion(major: 1, minor: 2, patch: 3)

    static let majorOnlyYAML = "123"
    static let majorOnlyFullYAML = "123.0.0"
    static let majorOnly = SpecVersion(major: 123)

    static let invalidMajorYAML = "a.b.c"
    static let invalidMinorYAML = "1.a.b"
    static let invalidPatchYAML = "1.2.a"
}
