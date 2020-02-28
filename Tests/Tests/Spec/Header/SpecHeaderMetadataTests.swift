import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

final class SpecHeaderMetadataTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var headerMetadata: SpecHeaderMetadata!
        var headerMetadataYAML: String!

        describe("Any header metadata") {
            beforeEach {
                headerMetadata = SpecHeaderMetadataSeeds.any
                headerMetadataYAML = SpecHeaderMetadataSeeds.anyYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedHeaderMetadata = try YAMLDecoder.test.decode(
                        SpecHeaderMetadata.self,
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
                headerMetadata = SpecHeaderMetadataSeeds.rateLimitLimit
                headerMetadataYAML = SpecHeaderMetadataSeeds.rateLimitLimitYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedHeaderMetadata = try YAMLDecoder.test.decode(
                        SpecHeaderMetadata.self,
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
                headerMetadata = SpecHeaderMetadataSeeds.uid
                headerMetadataYAML = SpecHeaderMetadataSeeds.uidYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedHeaderMetadata = try YAMLDecoder.test.decode(
                        SpecHeaderMetadata.self,
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
                headerMetadata = SpecHeaderMetadataSeeds.email
                headerMetadataYAML = SpecHeaderMetadataSeeds.emailYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedHeaderMetadata = try YAMLDecoder.test.decode(
                        SpecHeaderMetadata.self,
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
                headerMetadata = SpecHeaderMetadataSeeds.location
                headerMetadataYAML = SpecHeaderMetadataSeeds.locationYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedHeaderMetadata = try YAMLDecoder.test.decode(
                        SpecHeaderMetadata.self,
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
