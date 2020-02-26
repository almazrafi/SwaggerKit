import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SwaggerHeaderSpec: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var header: SwaggerHeader!
        var headerYAML: String!

        describe("X-Rate-Limit-Limit header") {
            beforeEach {
                header = SwaggerHeaderSeeds.rateLimitLimit
                headerYAML = SwaggerHeaderSeeds.rateLimitLimitYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedHeader = try YAMLDecoder.test.decode(
                        SwaggerHeader.self,
                        from: headerYAML
                    )

                    expect(decodedHeader).to(equal(header))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedHeaderYAML = try YAMLEncoder.test.encode(header)

                    expect(encodedHeaderYAML).to(equal(try headerYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("UID header") {
            beforeEach {
                header = SwaggerHeaderSeeds.uid
                headerYAML = SwaggerHeaderSeeds.uidYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedHeader = try YAMLDecoder.test.decode(
                        SwaggerHeader.self,
                        from: headerYAML
                    )

                    expect(decodedHeader).to(equal(header))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedHeaderYAML = try YAMLEncoder.test.encode(header)

                    expect(encodedHeaderYAML).to(equal(try headerYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Email header") {
            beforeEach {
                header = SwaggerHeaderSeeds.email
                headerYAML = SwaggerHeaderSeeds.emailYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedHeader = try YAMLDecoder.test.decode(
                        SwaggerHeader.self,
                        from: headerYAML
                    )

                    expect(decodedHeader).to(equal(header))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedHeaderYAML = try YAMLEncoder.test.encode(header)

                    expect(encodedHeaderYAML).to(equal(try headerYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Location header") {
            beforeEach {
                header = SwaggerHeaderSeeds.location
                headerYAML = SwaggerHeaderSeeds.locationYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedHeader = try YAMLDecoder.test.decode(
                        SwaggerHeader.self,
                        from: headerYAML
                    )

                    expect(decodedHeader).to(equal(header))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedHeaderYAML = try YAMLEncoder.test.encode(header)

                    expect(encodedHeaderYAML).to(equal(try headerYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe(".extensions") {
            beforeEach {
                header = SwaggerHeaderSeeds.location
            }

            it("should return extensions") {
                expect(header.extensions as? [String: Bool]).to(equal(["private": true]))
            }

            it("should modify extensions") {
                header.extensions["private"] = false

                expect(header.extensions as? [String: Bool]).to(equal(["private": false]))
            }
        }
    }
}
