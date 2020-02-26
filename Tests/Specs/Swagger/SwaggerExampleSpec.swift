import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SwaggerExampleSpec: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var example: SwaggerExample!
        var exampleYAML: String!

        describe("UID example") {
            beforeEach {
                example = SwaggerExampleSeeds.uid
                exampleYAML = SwaggerExampleSeeds.uidYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedExample = try YAMLDecoder.test.decode(
                        SwaggerExample.self,
                        from: exampleYAML
                    )

                    expect(decodedExample).to(equal(example))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedExampleYAML = try YAMLEncoder.test.encode(example)

                    expect(encodedExampleYAML).to(equal(try exampleYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Rating example") {
            beforeEach {
                example = SwaggerExampleSeeds.rating
                exampleYAML = SwaggerExampleSeeds.ratingYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedExample = try YAMLDecoder.test.decode(
                        SwaggerExample.self,
                        from: exampleYAML
                    )

                    expect(decodedExample).to(equal(example))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedExampleYAML = try YAMLEncoder.test.encode(example)

                    expect(encodedExampleYAML).to(equal(try exampleYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Email example") {
            beforeEach {
                example = SwaggerExampleSeeds.email
                exampleYAML = SwaggerExampleSeeds.emailYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedExample = try YAMLDecoder.test.decode(
                        SwaggerExample.self,
                        from: exampleYAML
                    )

                    expect(decodedExample).to(equal(example))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedExampleYAML = try YAMLEncoder.test.encode(example)

                    expect(encodedExampleYAML).to(equal(try exampleYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Languages example") {
            beforeEach {
                example = SwaggerExampleSeeds.languages
                exampleYAML = SwaggerExampleSeeds.languagesYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedExample = try YAMLDecoder.test.decode(
                        SwaggerExample.self,
                        from: exampleYAML
                    )

                    expect(decodedExample).to(equal(example))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedExampleYAML = try YAMLEncoder.test.encode(example)

                    expect(encodedExampleYAML).to(equal(try exampleYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Image size example") {
            beforeEach {
                example = SwaggerExampleSeeds.imageSize
                exampleYAML = SwaggerExampleSeeds.imageSizeYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedExample = try YAMLDecoder.test.decode(
                        SwaggerExample.self,
                        from: exampleYAML
                    )

                    expect(decodedExample).to(equal(example))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedExampleYAML = try YAMLEncoder.test.encode(example)

                    expect(encodedExampleYAML).to(equal(try exampleYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Image example") {
            beforeEach {
                example = SwaggerExampleSeeds.image
                exampleYAML = SwaggerExampleSeeds.imageYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedExample = try YAMLDecoder.test.decode(
                        SwaggerExample.self,
                        from: exampleYAML
                    )

                    expect(decodedExample).to(equal(example))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedExampleYAML = try YAMLEncoder.test.encode(example)

                    expect(encodedExampleYAML).to(equal(try exampleYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe(".extensions") {
            beforeEach {
                example = SwaggerExampleSeeds.image
            }

            it("should return extensions") {
                expect(example.extensions as? [String: Bool]).to(equal(["private": true]))
            }

            it("should modify extensions") {
                example.extensions["private"] = false

                expect(example.extensions as? [String: Bool]).to(equal(["private": false]))
            }
        }
    }
}
