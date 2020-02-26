import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SwaggerStringSchemaSpec: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var schema: SwaggerStringSchema!
        var schemaYAML: String!

        describe("Any string schema") {
            beforeEach {
                schema = SwaggerStringSchemaSeeds.any
                schemaYAML = SwaggerStringSchemaSeeds.anyYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerStringSchema.self,
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
                schema = SwaggerStringSchemaSeeds.email
                schemaYAML = SwaggerStringSchemaSeeds.emailYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerStringSchema.self,
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
                schema = SwaggerStringSchemaSeeds.mediaType
                schemaYAML = SwaggerStringSchemaSeeds.mediaTypeYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerStringSchema.self,
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
                schema = SwaggerStringSchemaSeeds.data
                schemaYAML = SwaggerStringSchemaSeeds.dataYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerStringSchema.self,
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
                    schema = SwaggerStringSchemaSeeds.data
                }

                it("should return the format") {
                    expect(schema.format).to(equal(.binary))
                }

                it("should set `rawFormat` to `rawValue` of the new format") {
                    schema.format = .byte

                    expect(schema.rawFormat).to(equal(SwaggerStringFormat.byte.rawValue))
                }
            }

            context("when string format is not specified") {
                beforeEach {
                    schema = SwaggerStringSchemaSeeds.any
                }

                it("should return nil") {
                    expect(schema.format).to(beNil())
                }

                it("should set `rawFormat` to `rawValue` of the new format") {
                    schema.format = .byte

                    expect(schema.rawFormat).to(equal(SwaggerStringFormat.byte.rawValue))
                }
            }
        }
    }
}
