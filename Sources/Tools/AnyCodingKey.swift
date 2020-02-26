import Foundation

internal struct AnyCodingKey: CodingKey {

    // MARK: - Instance Properties

    internal private(set) var stringValue: String
    internal private(set) var intValue: Int?

    // MARK: - Initializers

    internal init(_ stringValue: String) {
        self.stringValue = stringValue
        self.intValue = nil
    }

    internal init(_ intValue: Int) {
        self.stringValue = "\(intValue)"
        self.intValue = intValue
    }

    internal init?(stringValue: String) {
        self.init(stringValue)
    }

    internal init?(intValue: Int) {
        self.init(intValue)
    }
}
