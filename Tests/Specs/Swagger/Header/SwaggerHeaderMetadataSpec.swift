import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SwaggerHeaderMetadataSpec: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var headerMetadata: SwaggerHeaderMetadata!
        var headerMetadataYAML: String!

        describe("Any header metadata") {
            beforeEach {
                headerMetadata = SwaggerHeaderMetadataSeeds.any
                headerMetadataYAML = SwaggerHeaderMetadataSeeds.anyYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedHeaderMetadata = try YAMLDecoder.test.decode(
                        SwaggerHeaderMetadata.self,
                        from: headerMetadataYAML
                    )

                    expect(decodedHeaderMetadata).to(equal(headerMetadata))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedHeaderMetadataYAML = try YAMLEncoder.test.encode(headerMetadata)

                    expect(encodedHeaderMetadataYAML).to(equal(try headerMetadataYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("X-Rate-Limit-Limit header metadata") {
            beforeEach {
                headerMetadata = SwaggerHeaderMetadataSeeds.rateLimitLimit
                headerMetadataYAML = SwaggerHeaderMetadataSeeds.rateLimitLimitYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedHeaderMetadata = try YAMLDecoder.test.decode(
                        SwaggerHeaderMetadata.self,
                        from: headerMetadataYAML
                    )

                    expect(decodedHeaderMetadata).to(equal(headerMetadata))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedHeaderMetadataYAML = try YAMLEncoder.test.encode(headerMetadata)

                    expect(encodedHeaderMetadataYAML).to(equal(try headerMetadataYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("UID header metadata") {
            beforeEach {
                headerMetadata = SwaggerHeaderMetadataSeeds.uid
                headerMetadataYAML = SwaggerHeaderMetadataSeeds.uidYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedHeaderMetadata = try YAMLDecoder.test.decode(
                        SwaggerHeaderMetadata.self,
                        from: headerMetadataYAML
                    )

                    expect(decodedHeaderMetadata).to(equal(headerMetadata))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedHeaderMetadataYAML = try YAMLEncoder.test.encode(headerMetadata)

                    expect(encodedHeaderMetadataYAML).to(equal(try headerMetadataYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Email header metadata") {
            beforeEach {
                headerMetadata = SwaggerHeaderMetadataSeeds.email
                headerMetadataYAML = SwaggerHeaderMetadataSeeds.emailYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedHeaderMetadata = try YAMLDecoder.test.decode(
                        SwaggerHeaderMetadata.self,
                        from: headerMetadataYAML
                    )

                    expect(decodedHeaderMetadata).to(equal(headerMetadata))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedHeaderMetadataYAML = try YAMLEncoder.test.encode(headerMetadata)

                    expect(encodedHeaderMetadataYAML).to(equal(try headerMetadataYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Location header metadata") {
            beforeEach {
                headerMetadata = SwaggerHeaderMetadataSeeds.location
                headerMetadataYAML = SwaggerHeaderMetadataSeeds.locationYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedHeaderMetadata = try YAMLDecoder.test.decode(
                        SwaggerHeaderMetadata.self,
                        from: headerMetadataYAML
                    )

                    expect(decodedHeaderMetadata).to(equal(headerMetadata))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedHeaderMetadataYAML = try YAMLEncoder.test.encode(headerMetadata)

                    expect(encodedHeaderMetadataYAML).to(equal(try headerMetadataYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }
    }
}
