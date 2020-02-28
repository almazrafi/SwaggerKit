import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SpecParameterSchemaTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var parameterSchema: SpecParameterSchema!
        var parameterSchemaYAML: String!

        describe("UID parameter schema") {
            beforeEach {
                parameterSchema = SpecParameterSchemaSeeds.uid
                parameterSchemaYAML = SpecParameterSchemaSeeds.uidYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedParameterSchema = try YAMLDecoder.test.decode(
                        SpecParameterSchema.self,
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
                parameterSchema = SpecParameterSchemaSeeds.email
                parameterSchemaYAML = SpecParameterSchemaSeeds.emailYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedParameterSchema = try YAMLDecoder.test.decode(
                        SpecParameterSchema.self,
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
                parameterSchema = SpecParameterSchemaSeeds.location
                parameterSchemaYAML = SpecParameterSchemaSeeds.locationYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedParameterSchema = try YAMLDecoder.test.decode(
                        SpecParameterSchema.self,
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
