import Foundation
import Yams

extension YAMLEncoder {

    // MARK: - Type Properties

    static var test: YAMLEncoder {
        let encoder = YAMLEncoder()

        encoder.options.indent = 2
        encoder.options.sortKeys = true

        return encoder
    }
}
