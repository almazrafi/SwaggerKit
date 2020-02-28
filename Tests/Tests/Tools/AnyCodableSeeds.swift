import Foundation

enum AnyCodableSeeds {

    // MARK: - Type Properties

    static let nonCodableJSON = Data()
    static let nonCodable = Data()

    static let arrayJSON = """
        [
          1,
          2,
          null,
          4
        ]
        """.data(using: .utf8)!

    static let array: [Int?] = [1, 2, nil, 4]

    static let dictionaryJSON = """
        {
          "boolean" : true,
          "date" : "2001-01-01T00:02:03Z",
          "double" : 4.5599999999999996,
          "float" : 78.900001525878906,
          "integer" : -123,
          "string" : "Text",
          "unsigned integer" : 9223372036854775809,
          "url" : "https:\\/\\/swift.org"
        }
        """.data(using: .utf8)!

    static let dictionary: [String: Any] = [
        "boolean": true,
        "integer": -123,
        "unsigned integer": UInt(9_223_372_036_854_775_809),
        "double": 4.56,
        "float": Float(78.9),
        "string": "Text",
        "date": Date(timeIntervalSinceReferenceDate: 123.456),
        "url": URL(string: "https://swift.org")!
    ]

    static let nestedDictionaryJSON = """
        {
          "nested" : {
            "int8" : -12,
            "int16" : -34,
            "int32" : -56,
            "int64" : -78,
            "uint8" : 12,
            "uint16" : 34,
            "uint32" : 56,
            "uint64" : 78
          }
        }
        """.data(using: .utf8)!

    static let nestedDictionary: [String: Any] = [
        "nested": [
            "int8": Int8(-12),
            "int16": Int16(-34),
            "int32": Int32(-56),
            "int64": Int64(-78),
            "uint8": UInt8(12),
            "uint16": UInt16(34),
            "uint32": UInt32(56),
            "uint64": UInt64(78)
        ]
    ]
}
