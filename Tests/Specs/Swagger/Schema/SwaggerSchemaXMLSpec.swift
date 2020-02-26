import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SwaggerSchemaXMLSpec: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var schemaXML: SwaggerSchemaXML!
        var schemaXMLYAML: String!

        describe("Schema XML attribute") {
            beforeEach {
                schemaXML = SwaggerSchemaXMLSeeds.attribute
                schemaXMLYAML = SwaggerSchemaXMLSeeds.attributeYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchemaXML = try YAMLDecoder.test.decode(
                        SwaggerSchemaXML.self,
                        from: schemaXMLYAML
                    )

                    expect(decodedSchemaXML).to(equal(schemaXML))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedSchemaXMLYAML = try YAMLEncoder.test.encode(schemaXML)

                    expect(encodedSchemaXMLYAML).to(equal(try schemaXMLYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Schema XML namespace") {
            beforeEach {
                schemaXML = SwaggerSchemaXMLSeeds.namespace
                schemaXMLYAML = SwaggerSchemaXMLSeeds.namespaceYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchemaXML = try YAMLDecoder.test.decode(
                        SwaggerSchemaXML.self,
                        from: schemaXMLYAML
                    )

                    expect(decodedSchemaXML).to(equal(schemaXML))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedSchemaXMLYAML = try YAMLEncoder.test.encode(schemaXML)

                    expect(encodedSchemaXMLYAML).to(equal(try schemaXMLYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Schema XML wrapped array") {
            beforeEach {
                schemaXML = SwaggerSchemaXMLSeeds.wrappedArray
                schemaXMLYAML = SwaggerSchemaXMLSeeds.wrappedArrayYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchemaXML = try YAMLDecoder.test.decode(
                        SwaggerSchemaXML.self,
                        from: schemaXMLYAML
                    )

                    expect(decodedSchemaXML).to(equal(schemaXML))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedSchemaXMLYAML = try YAMLEncoder.test.encode(schemaXML)

                    expect(encodedSchemaXMLYAML).to(equal(try schemaXMLYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe(".extensions") {
            beforeEach {
                schemaXML = SwaggerSchemaXMLSeeds.wrappedArray
            }

            it("should return extensions") {
                expect(schemaXML.extensions as? [String: Bool]).to(equal(["private": true]))
            }

            it("should modify extensions") {
                schemaXML.extensions["private"] = false

                expect(schemaXML.extensions as? [String: Bool]).to(equal(["private": false]))
            }
        }
    }
}
