import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SwaggerSchemaSpec: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var schema: SwaggerSchema!
        var schemaYAML: String!

        describe("Any schema") {
            beforeEach {
                schema = SwaggerSchemaSeeds.any
                schemaYAML = SwaggerSchemaSeeds.anyYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerSchema.self,
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

        describe("Boolean schema") {
            beforeEach {
                schema = SwaggerSchemaSeeds.boolean
                schemaYAML = SwaggerSchemaSeeds.booleanYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerSchema.self,
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

        describe("Integer schema") {
            beforeEach {
                schema = SwaggerSchemaSeeds.integer
                schemaYAML = SwaggerSchemaSeeds.integerYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerSchema.self,
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

        describe("Number schema") {
            beforeEach {
                schema = SwaggerSchemaSeeds.number
                schemaYAML = SwaggerSchemaSeeds.numberYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerSchema.self,
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

        describe("String schema") {
            beforeEach {
                schema = SwaggerSchemaSeeds.string
                schemaYAML = SwaggerSchemaSeeds.stringYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerSchema.self,
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

        describe("Array schema") {
            beforeEach {
                schema = SwaggerSchemaSeeds.array
                schemaYAML = SwaggerSchemaSeeds.arrayYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerSchema.self,
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

        describe("Object schema") {
            beforeEach {
                schema = SwaggerSchemaSeeds.object
                schemaYAML = SwaggerSchemaSeeds.objectYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerSchema.self,
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

        describe("AllOf schema") {
            beforeEach {
                schema = SwaggerSchemaSeeds.allOf
                schemaYAML = SwaggerSchemaSeeds.allOfYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerSchema.self,
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

        describe("AnyOf schema") {
            beforeEach {
                schema = SwaggerSchemaSeeds.anyOf
                schemaYAML = SwaggerSchemaSeeds.anyOfYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerSchema.self,
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

        describe("OneOf schema") {
            beforeEach {
                schema = SwaggerSchemaSeeds.oneOf
                schemaYAML = SwaggerSchemaSeeds.oneOfYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerSchema.self,
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

        describe("Availability schema") {
            beforeEach {
                schema = SwaggerSchemaSeeds.availability
                schemaYAML = SwaggerSchemaSeeds.availabilityYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerSchema.self,
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

        describe("Video duration schema") {
            beforeEach {
                schema = SwaggerSchemaSeeds.videoDuration
                schemaYAML = SwaggerSchemaSeeds.videoDurationYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerSchema.self,
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

        describe("Content rating schema") {
            beforeEach {
                schema = SwaggerSchemaSeeds.contentRating
                schemaYAML = SwaggerSchemaSeeds.contentRatingYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerSchema.self,
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

        describe("UID schema") {
            beforeEach {
                schema = SwaggerSchemaSeeds.uid
                schemaYAML = SwaggerSchemaSeeds.uidYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerSchema.self,
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

        describe("Rating schema") {
            beforeEach {
                schema = SwaggerSchemaSeeds.rating
                schemaYAML = SwaggerSchemaSeeds.ratingYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerSchema.self,
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

        describe("Price category schema") {
            beforeEach {
                schema = SwaggerSchemaSeeds.priceCategory
                schemaYAML = SwaggerSchemaSeeds.priceCategoryYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerSchema.self,
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

        describe("Email schema") {
            beforeEach {
                schema = SwaggerSchemaSeeds.email
                schemaYAML = SwaggerSchemaSeeds.emailYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerSchema.self,
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

        describe("Media type schema") {
            beforeEach {
                schema = SwaggerSchemaSeeds.mediaType
                schemaYAML = SwaggerSchemaSeeds.mediaTypeYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerSchema.self,
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

        describe("Data schema") {
            beforeEach {
                schema = SwaggerSchemaSeeds.data
                schemaYAML = SwaggerSchemaSeeds.dataYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerSchema.self,
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

        describe("String-to-string schema") {
            beforeEach {
                schema = SwaggerSchemaSeeds.stringToString
                schemaYAML = SwaggerSchemaSeeds.stringToStringYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerSchema.self,
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

        describe("Implicit image size schema") {
            beforeEach {
                schema = SwaggerSchemaSeeds.imageSize
                schemaYAML = SwaggerSchemaSeeds.implicitImageSizeYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerSchema.self,
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

                    expect(encodedSchemaYAML).to(equal(try SwaggerSchemaSeeds.imageSizeYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Image size schema") {
            beforeEach {
                schema = SwaggerSchemaSeeds.imageSize
                schemaYAML = SwaggerSchemaSeeds.imageSizeYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerSchema.self,
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

        describe("Implicit languages schema") {
            beforeEach {
                schema = SwaggerSchemaSeeds.languages
                schemaYAML = SwaggerSchemaSeeds.implicitLanguagesYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerSchema.self,
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

                    expect(encodedSchemaYAML).to(equal(try SwaggerSchemaSeeds.languagesYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Languages schema") {
            beforeEach {
                schema = SwaggerSchemaSeeds.languages
                schemaYAML = SwaggerSchemaSeeds.languagesYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerSchema.self,
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

        describe("Image file schema") {
            beforeEach {
                schema = SwaggerSchemaSeeds.imageFile
                schemaYAML = SwaggerSchemaSeeds.imageFileYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SwaggerSchema.self,
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

        describe(".extensions") {
            beforeEach {
                schema = SwaggerSchemaSeeds.imageFile
            }

            it("should return extensions") {
                expect(schema.extensions as? [String: Bool]).to(equal(["private": true]))
            }

            it("should modify extensions") {
                schema.extensions["private"] = false

                expect(schema.extensions as? [String: Bool]).to(equal(["private": false]))
            }
        }
    }
}
