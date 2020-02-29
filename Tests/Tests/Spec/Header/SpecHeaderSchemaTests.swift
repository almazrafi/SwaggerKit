import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

final class SpecHeaderSchemaTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var headerSchema: SpecHeaderSchema!
        var headerSchemaYAML: String!

        describe("X-Rate-Limit-Limit header schema") {
            beforeEach {
                headerSchema = SpecHeaderSchemaSeeds.rateLimitLimit
                headerSchemaYAML = SpecHeaderSchemaSeeds.rateLimitLimitYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedHeaderSchema = try YAMLDecoder.test.decode(
                        SpecHeaderSchema.self,
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
                headerSchema = SpecHeaderSchemaSeeds.uid
                headerSchemaYAML = SpecHeaderSchemaSeeds.uidYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedHeaderSchema = try YAMLDecoder.test.decode(
                        SpecHeaderSchema.self,
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
                headerSchema = SpecHeaderSchemaSeeds.email
                headerSchemaYAML = SpecHeaderSchemaSeeds.emailYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedHeaderSchema = try YAMLDecoder.test.decode(
                        SpecHeaderSchema.self,
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
                headerSchema = SpecHeaderSchemaSeeds.location
                headerSchemaYAML = SpecHeaderSchemaSeeds.locationYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedHeaderSchema = try YAMLDecoder.test.decode(
                        SpecHeaderSchema.self,
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
