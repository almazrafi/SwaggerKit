import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SpecSchemaTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var schema: SpecSchema!
        var schemaYAML: String!

        describe("Any schema") {
            beforeEach {
                schema = SpecSchemaSeeds.any
                schemaYAML = SpecSchemaSeeds.anyYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SpecSchema.self,
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
                schema = SpecSchemaSeeds.boolean
                schemaYAML = SpecSchemaSeeds.booleanYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SpecSchema.self,
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
                schema = SpecSchemaSeeds.integer
                schemaYAML = SpecSchemaSeeds.integerYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SpecSchema.self,
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
                schema = SpecSchemaSeeds.number
                schemaYAML = SpecSchemaSeeds.numberYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SpecSchema.self,
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
                schema = SpecSchemaSeeds.string
                schemaYAML = SpecSchemaSeeds.stringYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SpecSchema.self,
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
                schema = SpecSchemaSeeds.array
                schemaYAML = SpecSchemaSeeds.arrayYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SpecSchema.self,
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
                schema = SpecSchemaSeeds.object
                schemaYAML = SpecSchemaSeeds.objectYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SpecSchema.self,
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
                schema = SpecSchemaSeeds.allOf
                schemaYAML = SpecSchemaSeeds.allOfYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SpecSchema.self,
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
                schema = SpecSchemaSeeds.anyOf
                schemaYAML = SpecSchemaSeeds.anyOfYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SpecSchema.self,
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
                schema = SpecSchemaSeeds.oneOf
                schemaYAML = SpecSchemaSeeds.oneOfYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SpecSchema.self,
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
                schema = SpecSchemaSeeds.availability
                schemaYAML = SpecSchemaSeeds.availabilityYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SpecSchema.self,
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
                schema = SpecSchemaSeeds.videoDuration
                schemaYAML = SpecSchemaSeeds.videoDurationYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SpecSchema.self,
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
                schema = SpecSchemaSeeds.contentRating
                schemaYAML = SpecSchemaSeeds.contentRatingYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SpecSchema.self,
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
                schema = SpecSchemaSeeds.uid
                schemaYAML = SpecSchemaSeeds.uidYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SpecSchema.self,
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
                schema = SpecSchemaSeeds.rating
                schemaYAML = SpecSchemaSeeds.ratingYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SpecSchema.self,
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
                schema = SpecSchemaSeeds.priceCategory
                schemaYAML = SpecSchemaSeeds.priceCategoryYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SpecSchema.self,
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
                schema = SpecSchemaSeeds.email
                schemaYAML = SpecSchemaSeeds.emailYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SpecSchema.self,
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
                schema = SpecSchemaSeeds.mediaType
                schemaYAML = SpecSchemaSeeds.mediaTypeYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SpecSchema.self,
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
                schema = SpecSchemaSeeds.data
                schemaYAML = SpecSchemaSeeds.dataYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SpecSchema.self,
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
                schema = SpecSchemaSeeds.stringToString
                schemaYAML = SpecSchemaSeeds.stringToStringYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SpecSchema.self,
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
                schema = SpecSchemaSeeds.imageSize
                schemaYAML = SpecSchemaSeeds.implicitImageSizeYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SpecSchema.self,
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

                    expect(encodedSchemaYAML).to(equal(try SpecSchemaSeeds.imageSizeYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Image size schema") {
            beforeEach {
                schema = SpecSchemaSeeds.imageSize
                schemaYAML = SpecSchemaSeeds.imageSizeYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SpecSchema.self,
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
                schema = SpecSchemaSeeds.languages
                schemaYAML = SpecSchemaSeeds.implicitLanguagesYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SpecSchema.self,
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

                    expect(encodedSchemaYAML).to(equal(try SpecSchemaSeeds.languagesYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Languages schema") {
            beforeEach {
                schema = SpecSchemaSeeds.languages
                schemaYAML = SpecSchemaSeeds.languagesYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SpecSchema.self,
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
                schema = SpecSchemaSeeds.imageFile
                schemaYAML = SpecSchemaSeeds.imageFileYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchema = try YAMLDecoder.test.decode(
                        SpecSchema.self,
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
                schema = SpecSchemaSeeds.imageFile
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
