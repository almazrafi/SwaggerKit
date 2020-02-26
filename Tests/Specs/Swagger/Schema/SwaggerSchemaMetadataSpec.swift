import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SwaggerSchemaMetadataSpec: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var schemaMetadata: SwaggerSchemaMetadata!
        var schemaMetadataYAML: String!

        describe("Any schema metadata") {
            beforeEach {
                schemaMetadata = SwaggerSchemaMetadataSeeds.any
                schemaMetadataYAML = SwaggerSchemaMetadataSeeds.anyYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchemaMetadata = try YAMLDecoder.test.decode(
                        SwaggerSchemaMetadata.self,
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
                schemaMetadata = SwaggerSchemaMetadataSeeds.availability
                schemaMetadataYAML = SwaggerSchemaMetadataSeeds.availabilityYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchemaMetadata = try YAMLDecoder.test.decode(
                        SwaggerSchemaMetadata.self,
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
                schemaMetadata = SwaggerSchemaMetadataSeeds.videoDuration
                schemaMetadataYAML = SwaggerSchemaMetadataSeeds.videoDurationYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchemaMetadata = try YAMLDecoder.test.decode(
                        SwaggerSchemaMetadata.self,
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
                schemaMetadata = SwaggerSchemaMetadataSeeds.uid
                schemaMetadataYAML = SwaggerSchemaMetadataSeeds.uidYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchemaMetadata = try YAMLDecoder.test.decode(
                        SwaggerSchemaMetadata.self,
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
                schemaMetadata = SwaggerSchemaMetadataSeeds.rating
                schemaMetadataYAML = SwaggerSchemaMetadataSeeds.ratingYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchemaMetadata = try YAMLDecoder.test.decode(
                        SwaggerSchemaMetadata.self,
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
                schemaMetadata = SwaggerSchemaMetadataSeeds.email
                schemaMetadataYAML = SwaggerSchemaMetadataSeeds.emailYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchemaMetadata = try YAMLDecoder.test.decode(
                        SwaggerSchemaMetadata.self,
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
                schemaMetadata = SwaggerSchemaMetadataSeeds.languages
                schemaMetadataYAML = SwaggerSchemaMetadataSeeds.languagesYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchemaMetadata = try YAMLDecoder.test.decode(
                        SwaggerSchemaMetadata.self,
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
                schemaMetadata = SwaggerSchemaMetadataSeeds.imageSize
                schemaMetadataYAML = SwaggerSchemaMetadataSeeds.imageSizeYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchemaMetadata = try YAMLDecoder.test.decode(
                        SwaggerSchemaMetadata.self,
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
