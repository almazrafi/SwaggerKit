import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

final class SpecExternalDocsTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var externalDocsYAML: String!
        var externalDocs: SpecExternalDocs!

        describe("External documentation with more info") {
            beforeEach {
                externalDocs = SpecExternalDocsSeeds.moreInfo
                externalDocsYAML = SpecExternalDocsSeeds.moreInfoYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedExternalDocs = try YAMLDecoder.test.decode(
                        SpecExternalDocs.self,
                        from: externalDocsYAML
                    )

                    expect(decodedExternalDocs).to(equal(externalDocs))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedExternalDocsYAML = try YAMLEncoder.test.encode(externalDocs)

                    expect(encodedExternalDocsYAML).to(equal(try externalDocsYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe(".extensions") {
            beforeEach {
                externalDocs = SpecExternalDocsSeeds.moreInfo
            }

            it("should return extensions") {
                expect(externalDocs.extensions as? [String: Bool]).to(equal(["private": true]))
            }

            it("should modify extensions") {
                externalDocs.extensions["private"] = false

                expect(externalDocs.extensions as? [String: Bool]).to(equal(["private": false]))
            }
        }
    }
}
