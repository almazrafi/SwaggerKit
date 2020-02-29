import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

final class SpecExternalDocumentationTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var externalDocumentationYAML: String!
        var externalDocumentation: SpecExternalDocumentation!

        describe("External documentation with more info") {
            beforeEach {
                externalDocumentation = SpecExternalDocumentationSeeds.moreInfo
                externalDocumentationYAML = SpecExternalDocumentationSeeds.moreInfoYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedExternalDocumentation = try YAMLDecoder.test.decode(
                        SpecExternalDocumentation.self,
                        from: externalDocumentationYAML
                    )

                    expect(decodedExternalDocumentation).to(equal(externalDocumentation))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedExternalDocumentationYAML = try YAMLEncoder.test.encode(externalDocumentation)

                    expect(encodedExternalDocumentationYAML).to(equal(try externalDocumentationYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe(".extensions") {
            beforeEach {
                externalDocumentation = SpecExternalDocumentationSeeds.moreInfo
            }

            it("should return extensions") {
                expect(externalDocumentation.extensions as? [String: Bool]).to(equal(["private": true]))
            }

            it("should modify extensions") {
                externalDocumentation.extensions["private"] = false

                expect(externalDocumentation.extensions as? [String: Bool]).to(equal(["private": false]))
            }
        }
    }
}
