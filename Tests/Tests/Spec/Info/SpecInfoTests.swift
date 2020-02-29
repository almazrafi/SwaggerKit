import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

final class SpecInfoTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var info: SpecInfo!
        var infoYAML: String!

        describe("Info") {
            beforeEach {
                info = SpecInfoSeeds.example
                infoYAML = SpecInfoSeeds.exampleYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedInfo = try YAMLDecoder.test.decode(
                        SpecInfo.self,
                        from: infoYAML
                    )

                    expect(decodedInfo).to(equal(info))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedInfoYAML = try YAMLEncoder.test.encode(info)

                    expect(encodedInfoYAML).to(equal(try infoYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe(".extensions") {
            beforeEach {
                info = SpecInfoSeeds.example
            }

            it("should return extensions") {
                expect(info.extensions as? [String: Bool]).to(equal(["private": true]))
            }

            it("should modify extensions") {
                info.extensions["private"] = false

                expect(info.extensions as? [String: Bool]).to(equal(["private": false]))
            }
        }
    }
}
