import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

final class SpecSecuritySchemeTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var securityScheme: SpecSecurityScheme!
        var securitySchemeYAML: String!

        describe("Invalid type of authentication") {
            beforeEach {
                securitySchemeYAML = SpecSecuritySchemeSeeds.invalidTypeYAML
            }

            it("should not be decoded") {
                do {
                    _ = try YAMLDecoder.test.decode(
                        SpecSecurityScheme.self,
                        from: securitySchemeYAML
                    )

                    fail("Test encountered unexpected behavior")
                } catch {
                    expect(error).to(beAKindOf(DecodingError.self))
                }
            }
        }

        describe("API Key authentication") {
            beforeEach {
                securityScheme = SpecSecuritySchemeSeeds.apiKey
                securitySchemeYAML = SpecSecuritySchemeSeeds.apiKeyYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSecurityScheme = try YAMLDecoder.test.decode(
                        SpecSecurityScheme.self,
                        from: securitySchemeYAML
                    )

                    expect(decodedSecurityScheme).to(equal(securityScheme))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedSecuritySchemeYAML = try YAMLEncoder.test.encode(securityScheme)

                    expect(encodedSecuritySchemeYAML).to(equal(try securitySchemeYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("OAuth 2.0 authentication") {
            beforeEach {
                securityScheme = SpecSecuritySchemeSeeds.oauth2
                securitySchemeYAML = SpecSecuritySchemeSeeds.oauth2YAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSecurityScheme = try YAMLDecoder.test.decode(
                        SpecSecurityScheme.self,
                        from: securitySchemeYAML
                    )

                    expect(decodedSecurityScheme).to(equal(securityScheme))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedSecuritySchemeYAML = try YAMLEncoder.test.encode(securityScheme)

                    expect(encodedSecuritySchemeYAML).to(equal(try securitySchemeYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Basic authentication") {
            beforeEach {
                securityScheme = SpecSecuritySchemeSeeds.basic
                securitySchemeYAML = SpecSecuritySchemeSeeds.basicYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSecurityScheme = try YAMLDecoder.test.decode(
                        SpecSecurityScheme.self,
                        from: securitySchemeYAML
                    )

                    expect(decodedSecurityScheme).to(equal(securityScheme))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedSecuritySchemeYAML = try YAMLEncoder.test.encode(securityScheme)

                    expect(encodedSecuritySchemeYAML).to(equal(try securitySchemeYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Bearer authentication") {
            beforeEach {
                securityScheme = SpecSecuritySchemeSeeds.bearer
                securitySchemeYAML = SpecSecuritySchemeSeeds.bearerYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSecurityScheme = try YAMLDecoder.test.decode(
                        SpecSecurityScheme.self,
                        from: securitySchemeYAML
                    )

                    expect(decodedSecurityScheme).to(equal(securityScheme))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedSecuritySchemeYAML = try YAMLEncoder.test.encode(securityScheme)

                    expect(encodedSecuritySchemeYAML).to(equal(try securitySchemeYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Digest authentication") {
            beforeEach {
                securityScheme = SpecSecuritySchemeSeeds.digest
                securitySchemeYAML = SpecSecuritySchemeSeeds.digestYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSecurityScheme = try YAMLDecoder.test.decode(
                        SpecSecurityScheme.self,
                        from: securitySchemeYAML
                    )

                    expect(decodedSecurityScheme).to(equal(securityScheme))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedSecuritySchemeYAML = try YAMLEncoder.test.encode(securityScheme)

                    expect(encodedSecuritySchemeYAML).to(equal(try securitySchemeYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("OpenID Connect authentication") {
            beforeEach {
                securityScheme = SpecSecuritySchemeSeeds.openIDConnect
                securitySchemeYAML = SpecSecuritySchemeSeeds.openIDConnectYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSecurityScheme = try YAMLDecoder.test.decode(
                        SpecSecurityScheme.self,
                        from: securitySchemeYAML
                    )

                    expect(decodedSecurityScheme).to(equal(securityScheme))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedSecuritySchemeYAML = try YAMLEncoder.test.encode(securityScheme)

                    expect(encodedSecuritySchemeYAML).to(equal(try securitySchemeYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe(".extensions") {
            beforeEach {
                securityScheme = SpecSecuritySchemeSeeds.openIDConnect
            }

            it("should return extensions") {
                expect(securityScheme.extensions as? [String: Bool]).to(equal(["private": true]))
            }

            it("should modify extensions") {
                securityScheme.extensions["private"] = false

                expect(securityScheme.extensions as? [String: Bool]).to(equal(["private": false]))
            }
        }
    }
}
