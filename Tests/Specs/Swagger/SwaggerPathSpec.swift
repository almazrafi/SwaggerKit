import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SwaggerPathSpec: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var path: SwaggerPath!
        var pathYAML: String!

        describe("Empty path") {
            beforeEach {
                path = SwaggerPathSeeds.empty
                pathYAML = SwaggerPathSeeds.emptyYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedPath = try YAMLDecoder.test.decode(
                        SwaggerPath.self,
                        from: pathYAML
                    )

                    expect(decodedPath).to(equal(path))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedPathYAML = try YAMLEncoder.test.encode(path)

                    expect(encodedPathYAML).to(equal(try pathYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Apps path") {
            beforeEach {
                path = SwaggerPathSeeds.apps
                pathYAML = SwaggerPathSeeds.appsYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedPath = try YAMLDecoder.test.decode(
                        SwaggerPath.self,
                        from: pathYAML
                    )

                    expect(decodedPath).to(equal(path))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedPathYAML = try YAMLEncoder.test.encode(path)

                    expect(encodedPathYAML).to(equal(try pathYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("App info path") {
            beforeEach {
                path = SwaggerPathSeeds.appInfo
                pathYAML = SwaggerPathSeeds.appInfoYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedPath = try YAMLDecoder.test.decode(
                        SwaggerPath.self,
                        from: pathYAML
                    )

                    expect(decodedPath).to(equal(path))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedPathYAML = try YAMLEncoder.test.encode(path)

                    expect(encodedPathYAML).to(equal(try pathYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe(".extensions") {
            beforeEach {
                path = SwaggerPathSeeds.appInfo
            }

            it("should return extensions") {
                expect(path.extensions as? [String: Bool]).to(equal(["private": true]))
            }

            it("should modify extensions") {
                path.extensions["private"] = false

                expect(path.extensions as? [String: Bool]).to(equal(["private": false]))
            }
        }
    }
}
