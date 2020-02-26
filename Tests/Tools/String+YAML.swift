import Foundation
import Yams

@testable import SwaggerKit

extension String {

    // MARK: - Instance Methods

    func yamlIndented(level: Int) -> String {
        let spaces = String(repeating: " ", count: level * 2)
        let lines = components(separatedBy: .newlines)

        return spaces.appending(lines.joined(separator: "\n\(spaces)"))
    }

    func yamlArrayItem() -> String {
        return "-\(yamlIndented(level: 1).dropFirst())"
    }

    func yamlSorted() throws -> String {
        return try YAMLEncoder.test.encode(try YAMLDecoder.test.decode(AnyCodable.self, from: self))
    }
}
