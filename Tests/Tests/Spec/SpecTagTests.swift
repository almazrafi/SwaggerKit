import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

final class SpecTagTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var tag: SpecTag!
        var tagYAML: String!

        describe("Any tag") {
            beforeEach {
                tag = SpecTagSeeds.any
                tagYAML = SpecTagSeeds.anyYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedTag = try YAMLDecoder.test.decode(
                        SpecTag.self,
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
                tag = SpecTagSeeds.private
                tagYAML = SpecTagSeeds.privateYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedTag = try YAMLDecoder.test.decode(
                        SpecTag.self,
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
                tag = SpecTagSeeds.private
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
