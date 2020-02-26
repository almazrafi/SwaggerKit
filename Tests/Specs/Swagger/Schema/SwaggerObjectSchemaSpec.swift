import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SwaggerObjectSchemaSpec: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var schema: SwaggerObjectSchema!
        var schemaYAML: String!

        describe("Implicitly any object schema") {
            beforeEach {
                schema = SwaggerObjectSchemaSeeds.any
                schemaYAML = SwaggerObjectSchemaSeeds.implicitlyAnyYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerObjectSchema.self,
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

                    expect(encodedSchemaYAML).to(equal(try SwaggerObjectSchemaSeeds.anyYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Any object schema") {
            beforeEach {
                schema = SwaggerObjectSchemaSeeds.any
                schemaYAML = SwaggerObjectSchemaSeeds.anyYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerObjectSchema.self,
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

        describe("String-to-string object schema") {
            beforeEach {
                schema = SwaggerObjectSchemaSeeds.stringToString
                schemaYAML = SwaggerObjectSchemaSeeds.stringToStringYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerObjectSchema.self,
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

        describe("Image size object schema") {
            beforeEach {
                schema = SwaggerObjectSchemaSeeds.imageSize
                schemaYAML = SwaggerObjectSchemaSeeds.imageSizeYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerObjectSchema.self,
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

        describe("Image object schema") {
            beforeEach {
                schema = SwaggerObjectSchemaSeeds.image
                schemaYAML = SwaggerObjectSchemaSeeds.imageYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerObjectSchema.self,
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

        describe("Video object schema") {
            beforeEach {
                schema = SwaggerObjectSchemaSeeds.video
                schemaYAML = SwaggerObjectSchemaSeeds.videoYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerObjectSchema.self,
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

        describe("Media object schema") {
            beforeEach {
                schema = SwaggerObjectSchemaSeeds.media
                schemaYAML = SwaggerObjectSchemaSeeds.mediaYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerObjectSchema.self,
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
