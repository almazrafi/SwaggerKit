import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

final class SpecExampleTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var example: SpecExample!
        var exampleYAML: String!

        describe("UID example") {
            beforeEach {
                example = SpecExampleSeeds.uid
                exampleYAML = SpecExampleSeeds.uidYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedExample = try YAMLDecoder.test.decode(
                        SpecExample.self,
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
                example = SpecExampleSeeds.rating
                exampleYAML = SpecExampleSeeds.ratingYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedExample = try YAMLDecoder.test.decode(
                        SpecExample.self,
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
                example = SpecExampleSeeds.email
                exampleYAML = SpecExampleSeeds.emailYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedExample = try YAMLDecoder.test.decode(
                        SpecExample.self,
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
                example = SpecExampleSeeds.languages
                exampleYAML = SpecExampleSeeds.languagesYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedExample = try YAMLDecoder.test.decode(
                        SpecExample.self,
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
                example = SpecExampleSeeds.imageSize
                exampleYAML = SpecExampleSeeds.imageSizeYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedExample = try YAMLDecoder.test.decode(
                        SpecExample.self,
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
                example = SpecExampleSeeds.image
                exampleYAML = SpecExampleSeeds.imageYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedExample = try YAMLDecoder.test.decode(
                        SpecExample.self,
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
                example = SpecExampleSeeds.image
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
