import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

final class SpecNumberSchemaTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var schema: SpecNumberSchema!
        var schemaYAML: String!

        describe("Any number schema") {
            beforeEach {
                schema = SpecNumberSchemaSeeds.any
                schemaYAML = SpecNumberSchemaSeeds.anyYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SpecNumberSchema.self,
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
                schema = SpecNumberSchemaSeeds.rating
                schemaYAML = SpecNumberSchemaSeeds.ratingYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SpecNumberSchema.self,
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
                schema = SpecNumberSchemaSeeds.priceCategory
                schemaYAML = SpecNumberSchemaSeeds.priceCategoryYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SpecNumberSchema.self,
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
                    schema = SpecNumberSchemaSeeds.priceCategory
                }

                it("should return the format") {
                    expect(schema.format).to(equal(.double))
                }

                it("should set `rawFormat` to `rawValue` of the new format") {
                    schema.format = .float

                    expect(schema.rawFormat).to(equal(SpecNumberFormat.float.rawValue))
                }
            }

            context("when integer format is not specified") {
                beforeEach {
                    schema = SpecNumberSchemaSeeds.any
                }

                it("should return nil") {
                    expect(schema.format).to(beNil())
                }

                it("should set `rawFormat` to `rawValue` of the new format") {
                    schema.format = .float

                    expect(schema.rawFormat).to(equal(SpecNumberFormat.float.rawValue))
                }
            }
        }
    }
}
