import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

final class SpecEmbeddedExampleTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var example: SpecEmbeddedExample!
        var exampleYAML: String!

        describe("Video duration embedded example") {
            beforeEach {
                example = SpecEmbeddedExampleSeeds.videoDuration
                exampleYAML = SpecEmbeddedExampleSeeds.videoDurationYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedExample = try YAMLDecoder.test.decode(
                        SpecEmbeddedExample.self,
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
                example = SpecEmbeddedExampleSeeds.uid
                exampleYAML = SpecEmbeddedExampleSeeds.uidYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedExample = try YAMLDecoder.test.decode(
                        SpecEmbeddedExample.self,
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
                example = SpecEmbeddedExampleSeeds.rating
                exampleYAML = SpecEmbeddedExampleSeeds.ratingYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedExample = try YAMLDecoder.test.decode(
                        SpecEmbeddedExample.self,
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
                example = SpecEmbeddedExampleSeeds.email
                exampleYAML = SpecEmbeddedExampleSeeds.emailYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedExample = try YAMLDecoder.test.decode(
                        SpecEmbeddedExample.self,
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
                example = SpecEmbeddedExampleSeeds.languages
                exampleYAML = SpecEmbeddedExampleSeeds.languagesYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedExample = try YAMLDecoder.test.decode(
                        SpecEmbeddedExample.self,
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
                example = SpecEmbeddedExampleSeeds.imageSize
                exampleYAML = SpecEmbeddedExampleSeeds.imageSizeYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedExample = try YAMLDecoder.test.decode(
                        SpecEmbeddedExample.self,
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
