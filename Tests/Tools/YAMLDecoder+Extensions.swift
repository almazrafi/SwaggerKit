import Foundation
import Yams

extension YAMLDecoder {

    // MARK: - Type Properties

    static var test: YAMLDecoder {
        YAMLDecoder(encoding: .default)
    }
}
