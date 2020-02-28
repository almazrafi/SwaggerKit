import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SpecOAuthImplicitFlowTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var flow: SpecOAuthImplicitFlow!
        var flowYAML: String!

        describe("Flow without any scopes") {
            beforeEach {
                flow = SpecOAuthImplicitFlowSeeds.noScopes
                flowYAML = SpecOAuthImplicitFlowSeeds.noScopesYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedFlow = try YAMLDecoder.test.decode(
                        SpecOAuthImplicitFlow.self,
                        from: flowYAML
                    )

                    expect(decodedFlow).to(equal(flow))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedFlowYAML = try YAMLEncoder.test.encode(flow)

                    expect(encodedFlowYAML).to(equal(try flowYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Flow with scopes for reading and writing app information") {
            beforeEach {
                flow = SpecOAuthImplicitFlowSeeds.readWriteApps
                flowYAML = SpecOAuthImplicitFlowSeeds.readWriteAppsYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedFlow = try YAMLDecoder.test.decode(
                        SpecOAuthImplicitFlow.self,
                        from: flowYAML
                    )

                    expect(decodedFlow).to(equal(flow))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedFlowYAML = try YAMLEncoder.test.encode(flow)

                    expect(encodedFlowYAML).to(equal(try flowYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe(".extensions") {
            beforeEach {
                flow = SpecOAuthImplicitFlowSeeds.readWriteApps
            }

            it("should return extensions") {
                expect(flow.extensions as? [String: Bool]).to(equal(["private": true]))
            }

            it("should modify extensions") {
                flow.extensions["private"] = false

                expect(flow.extensions as? [String: Bool]).to(equal(["private": false]))
            }
        }
    }
}
