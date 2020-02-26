import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class YAMLDecoderCodingPathExtensionSpec: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        describe("JSON Decoder") {
            var yamlDecoder: YAMLDecoder!
            var yamlString: String!

            beforeEach {
                yamlDecoder = YAMLDecoder()

                yamlString = """
                    foo:
                      bar:
                        a: 1
                        b: 2
                    """
            }

            describe("decode(:from:userInfo:codingPath:") {
                it("should correctly decode the data at the given path encoding") {
                    do {
                        let dictionary = try yamlDecoder.decode(
                            [String: Int].self,
                            from: yamlString,
                            codingPath: ["foo", "bar"]
                        )

                        expect(dictionary).to(equal(["a": 1, "b": 2]))
                    } catch {
                        fail("Test encountered unexpected error: \(error)")
                    }
                }

                it("should correctly decode the data at the given empty path encoding") {
                    do {
                        let dictionary = try yamlDecoder.decode(
                            [String: [String: [String: Int]]].self,
                            from: yamlString,
                            codingPath: []
                        )

                        expect(dictionary).to(equal(["foo": ["bar": ["a": 1, "b": 2]]]))
                    } catch {
                        fail("Test encountered unexpected error: \(error)")
                    }
                }

                it("should ignore the value of the `codingPath` key passed in the `userInfo` parameter") {
                    do {
                        let dictionary = try yamlDecoder.decode(
                            [String: Int].self,
                            from: yamlString,
                            userInfo: [.codingPath: "foobar"],
                            codingPath: ["foo", "bar"]
                        )

                        expect(dictionary).to(equal(["a": 1, "b": 2]))
                    } catch {
                        fail("Test encountered unexpected error: \(error)")
                    }
                }
            }
        }
    }
}
