import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SpecCallbacksTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var callbacks: SpecCallbacks!
        var callbacksYAML: String!

        describe("Subcription callbacks") {
            beforeEach {
                callbacks = SpecCallbacksSeeds.subscription
                callbacksYAML = SpecCallbacksSeeds.subscriptionYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedCallbacks = try YAMLDecoder.test.decode(
                        SpecCallbacks.self,
                        from: callbacksYAML
                    )

                    expect(decodedCallbacks).to(equal(callbacks))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedCallbacksYAML = try YAMLEncoder.test.encode(callbacks)

                    expect(encodedCallbacksYAML).to(equal(try callbacksYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe(".extensions") {
            beforeEach {
                callbacks = SpecCallbacksSeeds.subscription
            }

            it("should return extensions") {
                expect(callbacks.extensions as? [String: Bool]).to(equal(["private": true]))
            }

            it("should modify extensions") {
                callbacks.extensions["private"] = false

                expect(callbacks.extensions as? [String: Bool]).to(equal(["private": false]))
            }
        }
    }
}
