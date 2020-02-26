import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SwaggerParameterSchemaSpec: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var parameterSchema: SwaggerParameterSchema!
        var parameterSchemaYAML: String!

        describe("UID parameter schema") {
            beforeEach {
                parameterSchema = SwaggerParameterSchemaSeeds.uid
                parameterSchemaYAML = SwaggerParameterSchemaSeeds.uidYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedParameterSchema = try YAMLDecoder.test.decode(
                        SwaggerParameterSchema.self,
                        from: parameterSchemaYAML
                    )

                    expect(decodedParameterSchema).to(equal(parameterSchema))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedParameterSchemaYAML = try YAMLEncoder.test.encode(parameterSchema)

                    expect(encodedParameterSchemaYAML).to(equal(try parameterSchemaYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Email parameter schema") {
            beforeEach {
                parameterSchema = SwaggerParameterSchemaSeeds.email
                parameterSchemaYAML = SwaggerParameterSchemaSeeds.emailYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedParameterSchema = try YAMLDecoder.test.decode(
                        SwaggerParameterSchema.self,
                        from: parameterSchemaYAML
                    )

                    expect(decodedParameterSchema).to(equal(parameterSchema))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedParameterSchemaYAML = try YAMLEncoder.test.encode(parameterSchema)

                    expect(encodedParameterSchemaYAML).to(equal(try parameterSchemaYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Location parameter schema") {
            beforeEach {
                parameterSchema = SwaggerParameterSchemaSeeds.location
                parameterSchemaYAML = SwaggerParameterSchemaSeeds.locationYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedParameterSchema = try YAMLDecoder.test.decode(
                        SwaggerParameterSchema.self,
                        from: parameterSchemaYAML
                    )

                    expect(decodedParameterSchema).to(equal(parameterSchema))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedParameterSchemaYAML = try YAMLEncoder.test.encode(parameterSchema)

                    expect(encodedParameterSchemaYAML).to(equal(try parameterSchemaYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }
    }
}
