import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SwaggerIntegerSchemaSpec: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var schema: SwaggerIntegerSchema!
        var schemaYAML: String!

        describe("Any integer schema") {
            beforeEach {
                schema = SwaggerIntegerSchemaSeeds.any
                schemaYAML = SwaggerIntegerSchemaSeeds.anyYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerIntegerSchema.self,
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
                schema = SwaggerIntegerSchemaSeeds.videoDuration
                schemaYAML = SwaggerIntegerSchemaSeeds.videoDurationYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerIntegerSchema.self,
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
                schema = SwaggerIntegerSchemaSeeds.contentRating
                schemaYAML = SwaggerIntegerSchemaSeeds.contentRatingYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerIntegerSchema.self,
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
                schema = SwaggerIntegerSchemaSeeds.uid
                schemaYAML = SwaggerIntegerSchemaSeeds.uidYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerIntegerSchema.self,
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
                    schema = SwaggerIntegerSchemaSeeds.uid
                }

                it("should return the format") {
                    expect(schema.format).to(equal(.int64))
                }

                it("should set `rawFormat` to `rawValue` of the new format") {
                    schema.format = .int32

                    expect(schema.rawFormat).to(equal(SwaggerIntegerFormat.int32.rawValue))
                }
            }

            context("when integer format is not specified") {
                beforeEach {
                    schema = SwaggerIntegerSchemaSeeds.any
                }

                it("should return nil") {
                    expect(schema.format).to(beNil())
                }

                it("should set `rawFormat` to `rawValue` of the new format") {
                    schema.format = .int32

                    expect(schema.rawFormat).to(equal(SwaggerIntegerFormat.int32.rawValue))
                }
            }
        }
    }
}
