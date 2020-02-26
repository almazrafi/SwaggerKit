import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SwaggerBooleanSchemaSpec: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var schema: SwaggerBooleanSchema!
        var schemaYAML: String!

        describe("Any Boolean schema") {
            beforeEach {
                schema = SwaggerBooleanSchemaSeeds.any
                schemaYAML = SwaggerBooleanSchemaSeeds.anyYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerBooleanSchema.self,
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

        describe("Availability Boolean schema") {
            beforeEach {
                schema = SwaggerBooleanSchemaSeeds.availability
                schemaYAML = SwaggerBooleanSchemaSeeds.availabilityYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerBooleanSchema.self,
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
    }
}
