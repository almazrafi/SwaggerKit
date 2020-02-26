import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SwaggerSecuritySchemeSpec: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var securityScheme: SwaggerSecurityScheme!
        var securitySchemeYAML: String!

        describe("Invalid type of authentication") {
            beforeEach {
                securitySchemeYAML = SwaggerSecuritySchemeSeeds.invalidTypeYAML
            }

            it("should not be decoded") {
                do {
                    _ = try YAMLDecoder.test.decode(
                        SwaggerSecurityScheme.self,
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
                securityScheme = SwaggerSecuritySchemeSeeds.apiKey
                securitySchemeYAML = SwaggerSecuritySchemeSeeds.apiKeyYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSecurityScheme = try YAMLDecoder.test.decode(
                        SwaggerSecurityScheme.self,
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
                securityScheme = SwaggerSecuritySchemeSeeds.oauth2
                securitySchemeYAML = SwaggerSecuritySchemeSeeds.oauth2YAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSecurityScheme = try YAMLDecoder.test.decode(
                        SwaggerSecurityScheme.self,
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
                securityScheme = SwaggerSecuritySchemeSeeds.basic
                securitySchemeYAML = SwaggerSecuritySchemeSeeds.basicYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSecurityScheme = try YAMLDecoder.test.decode(
                        SwaggerSecurityScheme.self,
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
                securityScheme = SwaggerSecuritySchemeSeeds.bearer
                securitySchemeYAML = SwaggerSecuritySchemeSeeds.bearerYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSecurityScheme = try YAMLDecoder.test.decode(
                        SwaggerSecurityScheme.self,
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
                securityScheme = SwaggerSecuritySchemeSeeds.digest
                securitySchemeYAML = SwaggerSecuritySchemeSeeds.digestYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSecurityScheme = try YAMLDecoder.test.decode(
                        SwaggerSecurityScheme.self,
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
                securityScheme = SwaggerSecuritySchemeSeeds.openIDConnect
                securitySchemeYAML = SwaggerSecuritySchemeSeeds.openIDConnectYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSecurityScheme = try YAMLDecoder.test.decode(
                        SwaggerSecurityScheme.self,
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
                securityScheme = SwaggerSecuritySchemeSeeds.openIDConnect
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
