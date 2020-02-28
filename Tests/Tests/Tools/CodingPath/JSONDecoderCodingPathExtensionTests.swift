import Foundation
import Quick
import Nimble

@testable import SwaggerKit

class JSONDecoderCodingPathExtensionTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        describe("JSON Decoder") {
            var jsonDecoder: JSONDecoder!
            var jsonData: Data!

            beforeEach {
                jsonDecoder = JSONDecoder()

                jsonData = """
                    {
                        "foo": {
                            "bar": {
                                "a": 1,
                                "b": 2
                            }
                        }
                    }
                    """.data(using: .utf8)
            }

            describe("decode(:from:codingPath:") {
                it("should correctly decode the data at the given path encoding") {
                    do {
                        let dictionary = try jsonDecoder.decode(
                            [String: Int].self,
                            from: jsonData,
                            codingPath: ["foo", "bar"]
                        )

                        expect(dictionary).to(equal(["a": 1, "b": 2]))
                    } catch {
                        fail("Test encountered unexpected error: \(error)")
                    }
                }

                it("should correctly decode the data at the given empty path encoding") {
                    do {
                        let dictionary = try jsonDecoder.decode(
                            [String: [String: [String: Int]]].self,
                            from: jsonData,
                            codingPath: []
                        )

                        expect(dictionary).to(equal(["foo": ["bar": ["a": 1, "b": 2]]]))
                    } catch {
                        fail("Test encountered unexpected error: \(error)")
                    }
                }

                it("should ignore the value of the `codingPath` key from the `userInfo` property") {
                    do {
                        jsonDecoder.userInfo[.codingPath] = "foobar"

                        let dictionary = try jsonDecoder.decode(
                            [String: Int].self,
                            from: jsonData,
                            codingPath: ["foo", "bar"]
                        )

                        expect(dictionary).to(equal(["a": 1, "b": 2]))
                    } catch {
                        fail("Test encountered unexpected error: \(error)")
                    }
                }

                it("should not change the `userInfo` property") {
                    do {
                        jsonDecoder.userInfo[.codingPath] = "foobar"

                        _ = try jsonDecoder.decode(
                            [String: Int].self,
                            from: jsonData,
                            codingPath: ["foo", "bar"]
                        )

                        expect(jsonDecoder.userInfo[.codingPath] as? String).to(equal("foobar"))
                    } catch {
                        fail("Test encountered unexpected error: \(error)")
                    }
                }
            }
        }
    }
}
