import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SpecIntegerSchemaTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var schema: SpecIntegerSchema!
        var schemaYAML: String!

        describe("Any integer schema") {
            beforeEach {
                schema = SpecIntegerSchemaSeeds.any
                schemaYAML = SpecIntegerSchemaSeeds.anyYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SpecIntegerSchema.self,
                        from: schemaYAML
                    )

                    expect(decodedSchema).to(equal(schema))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedSchemaYAML = try YAMLEncoder.test.encode(schema)

                    expect(encodedSchemaYAML).to(equal(try schemaYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Video duration integer schema") {
            beforeEach {
                schema = SpecIntegerSchemaSeeds.videoDuration
                schemaYAML = SpecIntegerSchemaSeeds.videoDurationYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SpecIntegerSchema.self,
                        from: schemaYAML
                    )

                    expect(decodedSchema).to(equal(schema))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedSchemaYAML = try YAMLEncoder.test.encode(schema)

                    expect(encodedSchemaYAML).to(equal(try schemaYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Content rating integer schema") {
            beforeEach {
                schema = SpecIntegerSchemaSeeds.contentRating
                schemaYAML = SpecIntegerSchemaSeeds.contentRatingYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SpecIntegerSchema.self,
                        from: schemaYAML
                    )

                    expect(decodedSchema).to(equal(schema))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedSchemaYAML = try YAMLEncoder.test.encode(schema)

                    expect(encodedSchemaYAML).to(equal(try schemaYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("UID integer schema") {
            beforeEach {
                schema = SpecIntegerSchemaSeeds.uid
                schemaYAML = SpecIntegerSchemaSeeds.uidYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SpecIntegerSchema.self,
                        from: schemaYAML
                    )

                    expect(decodedSchema).to(equal(schema))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedSchemaYAML = try YAMLEncoder.test.encode(schema)

                    expect(encodedSchemaYAML).to(equal(try schemaYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe(".format") {
            context("when integer format is known") {
                beforeEach {
                    schema = SpecIntegerSchemaSeeds.uid
                }

                it("should return the format") {
                    expect(schema.format).to(equal(.int64))
                }

                it("should set `rawFormat` to `rawValue` of the new format") {
                    schema.format = .int32

                    expect(schema.rawFormat).to(equal(SpecIntegerFormat.int32.rawValue))
                }
            }

            context("when integer format is not specified") {
                beforeEach {
                    schema = SpecIntegerSchemaSeeds.any
                }

                it("should return nil") {
                    expect(schema.format).to(beNil())
                }

                it("should set `rawFormat` to `rawValue` of the new format") {
                    schema.format = .int32

                    expect(schema.rawFormat).to(equal(SpecIntegerFormat.int32.rawValue))
                }
            }
        }
    }
}
