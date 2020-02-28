import Foundation
import Quick
import Nimble

@testable import SwaggerKit

class AnyCodableTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        describe("AnyCodable") {
            context("when it is an array of optional primitives") {
                it("should be correctly decoded from JSON") {
                    do {
                        let anyCodable = try JSONDecoder.test.decode(
                            AnyCodable.self,
                            from: AnyCodableSeeds.arrayJSON
                        )

                        let array = anyCodable.value as? [Int?]

                        expect(array).to(equal([1, 2, nil, 4]))
                    } catch {
                        fail("Test encountered unexpected error: \(error)")
                    }
                }

                it("should be correctly encoded to JSON") {
                    do {
                        let json = try JSONEncoder.test.encode(AnyCodable(AnyCodableSeeds.array))

                        expect(json).to(equal(AnyCodableSeeds.arrayJSON))
                    } catch {
                        fail("Test encountered unexpected error: \(error)")
                    }
                }

                it("should be equal to another object with the same value") {
                    let lhs = AnyCodable(AnyCodableSeeds.array)
                    let rhs = AnyCodable(AnyCodableSeeds.array)

                    expect(lhs).to(equal(rhs))
                }

                it("should not be equal to another object with a different value type") {
                    let lhs = AnyCodable(AnyCodableSeeds.array)
                    let rhs = AnyCodable(AnyCodableSeeds.dictionary)

                    expect(lhs).toNot(equal(rhs))
                }
            }

            context("when it is a dictionary of primitives") {
                it("should be correctly decoded from JSON") {
                    do {
                        let anyCodable = try JSONDecoder.test.decode(
                            AnyCodable.self,
                            from: AnyCodableSeeds.dictionaryJSON
                        )

                        let dictionary = anyCodable.value as? [String: Any]

                        expect(dictionary?["boolean"] as? Bool).to(equal(true))
                        expect(dictionary?["integer"] as? Int).to(equal(-123))
                        expect(dictionary?["unsigned integer"] as? UInt).to(equal(9_223_372_036_854_775_809))
                        expect(dictionary?["double"] as? Double).to(beCloseTo(4.56))
                        expect(dictionary?["float"] as? Double).to(beCloseTo(78.9))
                        expect(dictionary?["string"] as? String).to(equal("Text"))
                        expect(dictionary?["date"] as? String).to(equal("2001-01-01T00:02:03Z"))
                        expect(dictionary?["url"] as? String).to(equal("https://swift.org"))
                    } catch {
                        fail("Test encountered unexpected error: \(error)")
                    }
                }

                it("should be correctly encoded to JSON") {
                    do {
                        let json = try JSONEncoder.test.encode(AnyCodable(AnyCodableSeeds.dictionary))

                        expect(json).to(equal(AnyCodableSeeds.dictionaryJSON))
                    } catch {
                        fail("Test encountered unexpected error: \(error)")
                    }
                }

                it("should be equal to another object with the same value") {
                    let lhs = AnyCodable(AnyCodableSeeds.dictionary)
                    let rhs = AnyCodable(AnyCodableSeeds.dictionary)

                    expect(lhs).to(equal(rhs))
                }

                it("should not be equal to another object with a different value type") {
                    let lhs = AnyCodable(AnyCodableSeeds.dictionary)
                    let rhs = AnyCodable(AnyCodableSeeds.array)

                    expect(lhs).toNot(equal(rhs))
                }
            }

            context("when it contains a nested dictionary") {
                it("should be correctly decoded from JSON") {
                    do {
                        let anyCodable = try JSONDecoder.test.decode(
                            AnyCodable.self,
                            from: AnyCodableSeeds.nestedDictionaryJSON
                        )

                        let dictionary = anyCodable.value as? [String: Any]
                        let nestedDictionary = dictionary?["nested"] as? [String: Int]

                        expect(nestedDictionary?["int8"]).to(equal(-12))
                        expect(nestedDictionary?["int16"]).to(equal(-34))
                        expect(nestedDictionary?["int32"]).to(equal(-56))
                        expect(nestedDictionary?["int64"]).to(equal(-78))
                        expect(nestedDictionary?["uint8"]).to(equal(12))
                        expect(nestedDictionary?["uint16"]).to(equal(34))
                        expect(nestedDictionary?["uint32"]).to(equal(56))
                        expect(nestedDictionary?["uint64"]).to(equal(78))
                    } catch {
                        fail("Test encountered unexpected error: \(error)")
                    }
                }

                it("should be correctly encoded to JSON") {
                    do {
                        let json = try JSONEncoder.test.encode(AnyCodable(AnyCodableSeeds.nestedDictionary))

                        expect(json).to(equal(AnyCodableSeeds.nestedDictionaryJSON))
                    } catch {
                        fail("Test encountered unexpected error: \(error)")
                    }
                }

                it("should be equal to another object with the same value") {
                    let lhs = AnyCodable(AnyCodableSeeds.nestedDictionary)
                    let rhs = AnyCodable(AnyCodableSeeds.nestedDictionary)

                    expect(lhs).to(equal(rhs))
                }

                it("should not be equal to another object with a different value type") {
                    let lhs = AnyCodable(AnyCodableSeeds.nestedDictionary)
                    let rhs = AnyCodable(AnyCodableSeeds.dictionary)

                    expect(lhs).toNot(equal(rhs))
                }
            }

            context("when it contains a non-codable value") {
                it("should throw an error when decoding from JSON") {
                    do {
                        _ = try JSONDecoder.test.decode(
                            AnyCodable.self,
                            from: AnyCodableSeeds.nonCodableJSON
                        )

                        fail("Test encountered unexpected behavior")
                    } catch {
                        expect(error).to(beAKindOf(DecodingError.self))
                    }
                }

                it("should throw an error when encoding to JSON") {
                    do {
                        _ = try JSONEncoder.test.encode(AnyCodable(AnyCodableSeeds.nonCodable))

                        fail("Test encountered unexpected behavior")
                    } catch {
                        expect(error).to(beAKindOf(EncodingError.self))
                    }
                }

                it("should not be equal to another object with the same value") {
                    let lhs = AnyCodable(AnyCodableSeeds.nonCodable)
                    let rhs = AnyCodable(AnyCodableSeeds.nonCodable)

                    expect(lhs).toNot(equal(rhs))
                }

                it("should not be equal to another object with a different value type") {
                    let lhs = AnyCodable(AnyCodableSeeds.nonCodable)
                    let rhs = AnyCodable(AnyCodableSeeds.array)

                    expect(lhs).toNot(equal(rhs))
                }
            }
        }
    }
}
