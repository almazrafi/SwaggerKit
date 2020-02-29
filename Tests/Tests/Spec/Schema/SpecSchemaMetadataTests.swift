import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

final class SpecSchemaMetadataTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var schemaMetadata: SpecSchemaMetadata!
        var schemaMetadataYAML: String!

        describe("Any schema metadata") {
            beforeEach {
                schemaMetadata = SpecSchemaMetadataSeeds.any
                schemaMetadataYAML = SpecSchemaMetadataSeeds.anyYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchemaMetadata = try YAMLDecoder.test.decode(
                        SpecSchemaMetadata.self,
                        from: schemaMetadataYAML
                    )

                    expect(decodedSchemaMetadata).to(equal(schemaMetadata))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedSchemaMetadataYAML = try YAMLEncoder.test.encode(schemaMetadata)

                    expect(encodedSchemaMetadataYAML).to(equal(try schemaMetadataYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Availability schema metadata") {
            beforeEach {
                schemaMetadata = SpecSchemaMetadataSeeds.availability
                schemaMetadataYAML = SpecSchemaMetadataSeeds.availabilityYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchemaMetadata = try YAMLDecoder.test.decode(
                        SpecSchemaMetadata.self,
                        from: schemaMetadataYAML
                    )

                    expect(decodedSchemaMetadata).to(equal(schemaMetadata))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedSchemaMetadataYAML = try YAMLEncoder.test.encode(schemaMetadata)

                    expect(encodedSchemaMetadataYAML).to(equal(try schemaMetadataYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Video duration schema metadata") {
            beforeEach {
                schemaMetadata = SpecSchemaMetadataSeeds.videoDuration
                schemaMetadataYAML = SpecSchemaMetadataSeeds.videoDurationYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchemaMetadata = try YAMLDecoder.test.decode(
                        SpecSchemaMetadata.self,
                        from: schemaMetadataYAML
                    )

                    expect(decodedSchemaMetadata).to(equal(schemaMetadata))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedSchemaMetadataYAML = try YAMLEncoder.test.encode(schemaMetadata)

                    expect(encodedSchemaMetadataYAML).to(equal(try schemaMetadataYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("UID schema metadata") {
            beforeEach {
                schemaMetadata = SpecSchemaMetadataSeeds.uid
                schemaMetadataYAML = SpecSchemaMetadataSeeds.uidYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchemaMetadata = try YAMLDecoder.test.decode(
                        SpecSchemaMetadata.self,
                        from: schemaMetadataYAML
                    )

                    expect(decodedSchemaMetadata).to(equal(schemaMetadata))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedSchemaMetadataYAML = try YAMLEncoder.test.encode(schemaMetadata)

                    expect(encodedSchemaMetadataYAML).to(equal(try schemaMetadataYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Rating schema metadata") {
            beforeEach {
                schemaMetadata = SpecSchemaMetadataSeeds.rating
                schemaMetadataYAML = SpecSchemaMetadataSeeds.ratingYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchemaMetadata = try YAMLDecoder.test.decode(
                        SpecSchemaMetadata.self,
                        from: schemaMetadataYAML
                    )

                    expect(decodedSchemaMetadata).to(equal(schemaMetadata))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedSchemaMetadataYAML = try YAMLEncoder.test.encode(schemaMetadata)

                    expect(encodedSchemaMetadataYAML).to(equal(try schemaMetadataYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Email schema metadata") {
            beforeEach {
                schemaMetadata = SpecSchemaMetadataSeeds.email
                schemaMetadataYAML = SpecSchemaMetadataSeeds.emailYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchemaMetadata = try YAMLDecoder.test.decode(
                        SpecSchemaMetadata.self,
                        from: schemaMetadataYAML
                    )

                    expect(decodedSchemaMetadata).to(equal(schemaMetadata))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedSchemaMetadataYAML = try YAMLEncoder.test.encode(schemaMetadata)

                    expect(encodedSchemaMetadataYAML).to(equal(try schemaMetadataYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Languages schema metadata") {
            beforeEach {
                schemaMetadata = SpecSchemaMetadataSeeds.languages
                schemaMetadataYAML = SpecSchemaMetadataSeeds.languagesYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchemaMetadata = try YAMLDecoder.test.decode(
                        SpecSchemaMetadata.self,
                        from: schemaMetadataYAML
                    )

                    expect(decodedSchemaMetadata).to(equal(schemaMetadata))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedSchemaMetadataYAML = try YAMLEncoder.test.encode(schemaMetadata)

                    expect(encodedSchemaMetadataYAML).to(equal(try schemaMetadataYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Image size schema metadata") {
            beforeEach {
                schemaMetadata = SpecSchemaMetadataSeeds.imageSize
                schemaMetadataYAML = SpecSchemaMetadataSeeds.imageSizeYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchemaMetadata = try YAMLDecoder.test.decode(
                        SpecSchemaMetadata.self,
                        from: schemaMetadataYAML
                    )

                    expect(decodedSchemaMetadata).to(equal(schemaMetadata))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedSchemaMetadataYAML = try YAMLEncoder.test.encode(schemaMetadata)

                    expect(encodedSchemaMetadataYAML).to(equal(try schemaMetadataYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }
    }
}
