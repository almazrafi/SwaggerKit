import Foundation

extension JSONDecoder {

    // MARK: - Type Properties

    static var test: JSONDecoder {
        let decoder = JSONDecoder()

        if #available(macOS 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *) {
            decoder.dateDecodingStrategy = .iso8601
        }

        return decoder
    }
}
