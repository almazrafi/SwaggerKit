import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SpecStringSchemaTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var schema: SpecStringSchema!
        var schemaYAML: String!

        describe("Any string schema") {
            beforeEach {
                schema = SpecStringSchemaSeeds.any
                schemaYAML = SpecStringSchemaSeeds.anyYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SpecStringSchema.self,
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

        describe("Email string schema") {
            beforeEach {
                schema = SpecStringSchemaSeeds.email
                schemaYAML = SpecStringSchemaSeeds.emailYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SpecStringSchema.self,
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

        describe("Media type string schema") {
            beforeEach {
                schema = SpecStringSchemaSeeds.mediaType
                schemaYAML = SpecStringSchemaSeeds.mediaTypeYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SpecStringSchema.self,
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

        describe("Data string schema") {
            beforeEach {
                schema = SpecStringSchemaSeeds.data
                schemaYAML = SpecStringSchemaSeeds.dataYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SpecStringSchema.self,
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
            context("when string format is known") {
                beforeEach {
                    schema = SpecStringSchemaSeeds.data
                }

                it("should return the format") {
                    expect(schema.format).to(equal(.binary))
                }

                it("should set `rawFormat` to `rawValue` of the new format") {
                    schema.format = .byte

                    expect(schema.rawFormat).to(equal(SpecStringFormat.byte.rawValue))
                }
            }

            context("when string format is not specified") {
                beforeEach {
                    schema = SpecStringSchemaSeeds.any
                }

                it("should return nil") {
                    expect(schema.format).to(beNil())
                }

                it("should set `rawFormat` to `rawValue` of the new format") {
                    schema.format = .byte

                    expect(schema.rawFormat).to(equal(SpecStringFormat.byte.rawValue))
                }
            }
        }
    }
}
