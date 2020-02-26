import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SwaggerTagSpec: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var tag: SwaggerTag!
        var tagYAML: String!

        describe("Any tag") {
            beforeEach {
                tag = SwaggerTagSeeds.any
                tagYAML = SwaggerTagSeeds.anyYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedTag = try YAMLDecoder.test.decode(
                        SwaggerTag.self,
                        from: tagYAML
                    )

                    expect(decodedTag).to(equal(tag))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedTagYAML = try YAMLEncoder.test.encode(tag)

                    expect(encodedTagYAML).to(equal(try tagYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Private methods tag") {
            beforeEach {
                tag = SwaggerTagSeeds.private
                tagYAML = SwaggerTagSeeds.privateYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedTag = try YAMLDecoder.test.decode(
                        SwaggerTag.self,
                        from: tagYAML
                    )

                    expect(decodedTag).to(equal(tag))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedTagYAML = try YAMLEncoder.test.encode(tag)

                    expect(encodedTagYAML).to(equal(try tagYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe(".extensions") {
            beforeEach {
                tag = SwaggerTagSeeds.private
            }

            it("should return extensions") {
                expect(tag.extensions as? [String: Bool]).to(equal(["private": true]))
            }

            it("should modify extensions") {
                tag.extensions["private"] = false

                expect(tag.extensions as? [String: Bool]).to(equal(["private": false]))
            }
        }
    }
}
