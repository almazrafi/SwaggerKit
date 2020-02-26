import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SwaggerEmbeddedExampleSpec: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var example: SwaggerEmbeddedExample!
        var exampleYAML: String!

        describe("Video duration embedded example") {
            beforeEach {
                example = SwaggerEmbeddedExampleSeeds.videoDuration
                exampleYAML = SwaggerEmbeddedExampleSeeds.videoDurationYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedExample = try YAMLDecoder.test.decode(
                        SwaggerEmbeddedExample.self,
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

        describe("UID embedded example") {
            beforeEach {
                example = SwaggerEmbeddedExampleSeeds.uid
                exampleYAML = SwaggerEmbeddedExampleSeeds.uidYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedExample = try YAMLDecoder.test.decode(
                        SwaggerEmbeddedExample.self,
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

        describe("Rating embedded example") {
            beforeEach {
                example = SwaggerEmbeddedExampleSeeds.rating
                exampleYAML = SwaggerEmbeddedExampleSeeds.ratingYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedExample = try YAMLDecoder.test.decode(
                        SwaggerEmbeddedExample.self,
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

        describe("Email embedded example") {
            beforeEach {
                example = SwaggerEmbeddedExampleSeeds.email
                exampleYAML = SwaggerEmbeddedExampleSeeds.emailYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedExample = try YAMLDecoder.test.decode(
                        SwaggerEmbeddedExample.self,
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

        describe("Languages embedded example") {
            beforeEach {
                example = SwaggerEmbeddedExampleSeeds.languages
                exampleYAML = SwaggerEmbeddedExampleSeeds.languagesYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedExample = try YAMLDecoder.test.decode(
                        SwaggerEmbeddedExample.self,
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

        describe("Image size embedded example") {
            beforeEach {
                example = SwaggerEmbeddedExampleSeeds.imageSize
                exampleYAML = SwaggerEmbeddedExampleSeeds.imageSizeYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedExample = try YAMLDecoder.test.decode(
                        SwaggerEmbeddedExample.self,
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
    }
}
