import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SwaggerContactInfoSpec: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var contactInfo: SwaggerContactInfo!
        var contactInfoYAML: String!

        describe("Contact Info") {
            beforeEach {
                contactInfo = SwaggerContactInfoSeeds.example
                contactInfoYAML = SwaggerContactInfoSeeds.exampleYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedContactInfo = try YAMLDecoder.test.decode(
                        SwaggerContactInfo.self,
                        from: contactInfoYAML
                    )

                    expect(decodedContactInfo).to(equal(contactInfo))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedContactInfoYAML = try YAMLEncoder.test.encode(contactInfo)

                    expect(encodedContactInfoYAML).to(equal(try contactInfoYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe(".extensions") {
            beforeEach {
                contactInfo = SwaggerContactInfoSeeds.example
            }

            it("should return extensions") {
                expect(contactInfo.extensions as? [String: Bool]).to(equal(["private": true]))
            }

            it("should modify extensions") {
                contactInfo.extensions["private"] = false

                expect(contactInfo.extensions as? [String: Bool]).to(equal(["private": false]))
            }
        }
    }
}
