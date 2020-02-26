import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SwaggerOAuthFlowsSpec: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var flows: SwaggerOAuthFlows!
        var flowsYAML: String!

        describe("Implicit only flows") {
            beforeEach {
                flows = SwaggerOAuthFlowsSeeds.implicitOnly
                flowsYAML = SwaggerOAuthFlowsSeeds.implicitOnlyYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedFlows = try YAMLDecoder.test.decode(
                        SwaggerOAuthFlows.self,
                        from: flowsYAML
                    )

                    expect(decodedFlows).to(equal(flows))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedFlowsYAML = try YAMLEncoder.test.encode(flows)

                    expect(encodedFlowsYAML).to(equal(try flowsYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Catchall flows") {
            beforeEach {
                flows = SwaggerOAuthFlowsSeeds.catchall
                flowsYAML = SwaggerOAuthFlowsSeeds.catchallYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedFlows = try YAMLDecoder.test.decode(
                        SwaggerOAuthFlows.self,
                        from: flowsYAML
                    )

                    expect(decodedFlows).to(equal(flows))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedFlowsYAML = try YAMLEncoder.test.encode(flows)

                    expect(encodedFlowsYAML).to(equal(try flowsYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe(".extensions") {
            beforeEach {
                flows = SwaggerOAuthFlowsSeeds.catchall
            }

            it("should return extensions") {
                expect(flows.extensions as? [String: Bool]).to(equal(["private": true]))
            }

            it("should modify extensions") {
                flows.extensions["private"] = false

                expect(flows.extensions as? [String: Bool]).to(equal(["private": false]))
            }
        }
    }
}
