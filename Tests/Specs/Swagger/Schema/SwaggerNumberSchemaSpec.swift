import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SwaggerNumberSchemaSpec: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var schema: SwaggerNumberSchema!
        var schemaYAML: String!

        describe("Any number schema") {
            beforeEach {
                schema = SwaggerNumberSchemaSeeds.any
                schemaYAML = SwaggerNumberSchemaSeeds.anyYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerNumberSchema.self,
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

        describe("Rating number schema") {
            beforeEach {
                schema = SwaggerNumberSchemaSeeds.rating
                schemaYAML = SwaggerNumberSchemaSeeds.ratingYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerNumberSchema.self,
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

        describe("Price category number schema") {
            beforeEach {
                schema = SwaggerNumberSchemaSeeds.priceCategory
                schemaYAML = SwaggerNumberSchemaSeeds.priceCategoryYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerNumberSchema.self,
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
                    schema = SwaggerNumberSchemaSeeds.priceCategory
                }

                it("should return the format") {
                    expect(schema.format).to(equal(.double))
                }

                it("should set `rawFormat` to `rawValue` of the new format") {
                    schema.format = .float

                    expect(schema.rawFormat).to(equal(SwaggerNumberFormat.float.rawValue))
                }
            }

            context("when integer format is not specified") {
                beforeEach {
                    schema = SwaggerNumberSchemaSeeds.any
                }

                it("should return nil") {
                    expect(schema.format).to(beNil())
                }

                it("should set `rawFormat` to `rawValue` of the new format") {
                    schema.format = .float

                    expect(schema.rawFormat).to(equal(SwaggerNumberFormat.float.rawValue))
                }
            }
        }
    }
}
