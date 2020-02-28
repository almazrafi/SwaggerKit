import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SpecPathTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var path: SpecPath!
        var pathYAML: String!

        describe("Empty path") {
            beforeEach {
                path = SpecPathSeeds.empty
                pathYAML = SpecPathSeeds.emptyYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedPath = try YAMLDecoder.test.decode(
                        SpecPath.self,
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
                path = SpecPathSeeds.apps
                pathYAML = SpecPathSeeds.appsYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedPath = try YAMLDecoder.test.decode(
                        SpecPath.self,
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
                path = SpecPathSeeds.appInfo
                pathYAML = SpecPathSeeds.appInfoYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedPath = try YAMLDecoder.test.decode(
                        SpecPath.self,
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
                path = SpecPathSeeds.appInfo
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
