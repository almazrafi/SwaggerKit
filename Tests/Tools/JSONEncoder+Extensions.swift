import Foundation

extension JSONEncoder {

    // MARK: - Type Properties

    static var test: JSONEncoder {
        let encoder = JSONEncoder()

        if #available(macOS 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *) {
            encoder.dateEncodingStrategy = .iso8601
        }

        if #available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *) {
            encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        } else {
            encoder.outputFormatting = [.prettyPrinted]
        }

        return encoder
    }
}
