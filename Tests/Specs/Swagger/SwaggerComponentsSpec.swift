import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SwaggerComponentsSpec: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var components: SwaggerComponents!
        var componentsYAML: String!

        describe("Empty components") {
            beforeEach {
                components = SwaggerComponentsSeeds.empty
                componentsYAML = SwaggerComponentsSeeds.emptyYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedComponents = try YAMLDecoder.test.decode(
                        SwaggerComponents.self,
                        from: componentsYAML
                    )

                    expect(decodedComponents).to(equal(components))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedComponentsYAML = try YAMLEncoder.test.encode(components)

                    expect(encodedComponentsYAML).to(equal(try componentsYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("AppStore components") {
            beforeEach {
                components = SwaggerComponentsSeeds.appStore
                componentsYAML = SwaggerComponentsSeeds.appStoreYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedComponents = try YAMLDecoder.test.decode(
                        SwaggerComponents.self,
                        from: componentsYAML
                    )

                    expect(decodedComponents).to(equal(components))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedComponentsYAML = try YAMLEncoder.test.encode(components)

                    print(try componentsYAML.yamlSorted())
                    print(encodedComponentsYAML)

                    expect(encodedComponentsYAML).to(equal(try componentsYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe(".extensions") {
            beforeEach {
                components = SwaggerComponentsSeeds.appStore
            }

            it("should return extensions") {
                expect(components.extensions as? [String: Bool]).to(equal(["private": true]))
            }

            it("should modify extensions") {
                components.extensions["private"] = false

                expect(components.extensions as? [String: Bool]).to(equal(["private": false]))
            }
        }
    }
}
