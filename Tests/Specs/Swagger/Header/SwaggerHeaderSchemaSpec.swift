import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SwaggerHeaderSchemaSpec: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var headerSchema: SwaggerHeaderSchema!
        var headerSchemaYAML: String!

        describe("X-Rate-Limit-Limit header schema") {
            beforeEach {
                headerSchema = SwaggerHeaderSchemaSeeds.rateLimitLimit
                headerSchemaYAML = SwaggerHeaderSchemaSeeds.rateLimitLimitYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedHeaderSchema = try YAMLDecoder.test.decode(
                        SwaggerHeaderSchema.self,
                        from: headerSchemaYAML
                    )

                    expect(decodedHeaderSchema).to(equal(headerSchema))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedHeaderSchemaYAML = try YAMLEncoder.test.encode(headerSchema)

                    expect(encodedHeaderSchemaYAML).to(equal(try headerSchemaYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("UID header schema") {
            beforeEach {
                headerSchema = SwaggerHeaderSchemaSeeds.uid
                headerSchemaYAML = SwaggerHeaderSchemaSeeds.uidYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedHeaderSchema = try YAMLDecoder.test.decode(
                        SwaggerHeaderSchema.self,
                        from: headerSchemaYAML
                    )

                    expect(decodedHeaderSchema).to(equal(headerSchema))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedHeaderSchemaYAML = try YAMLEncoder.test.encode(headerSchema)

                    expect(encodedHeaderSchemaYAML).to(equal(try headerSchemaYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Email header schema") {
            beforeEach {
                headerSchema = SwaggerHeaderSchemaSeeds.email
                headerSchemaYAML = SwaggerHeaderSchemaSeeds.emailYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedHeaderSchema = try YAMLDecoder.test.decode(
                        SwaggerHeaderSchema.self,
                        from: headerSchemaYAML
                    )

                    expect(decodedHeaderSchema).to(equal(headerSchema))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedHeaderSchemaYAML = try YAMLEncoder.test.encode(headerSchema)

                    expect(encodedHeaderSchemaYAML).to(equal(try headerSchemaYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Location header schema") {
            beforeEach {
                headerSchema = SwaggerHeaderSchemaSeeds.location
                headerSchemaYAML = SwaggerHeaderSchemaSeeds.locationYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedHeaderSchema = try YAMLDecoder.test.decode(
                        SwaggerHeaderSchema.self,
                        from: headerSchemaYAML
                    )

                    expect(decodedHeaderSchema).to(equal(headerSchema))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedHeaderSchemaYAML = try YAMLEncoder.test.encode(headerSchema)

                    expect(encodedHeaderSchemaYAML).to(equal(try headerSchemaYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }
    }
}
