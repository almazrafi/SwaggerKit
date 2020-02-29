import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

final class SpecMediaTypeTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var mediaType: SpecMediaType!
        var mediaTypeYAML: String!

        describe("UID media type") {
            beforeEach {
                mediaType = SpecMediaTypeSeeds.uid
                mediaTypeYAML = SpecMediaTypeSeeds.uidYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedMediaType = try YAMLDecoder.test.decode(
                        SpecMediaType.self,
                        from: mediaTypeYAML
                    )

                    expect(decodedMediaType).to(equal(mediaType))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedMediaTypeYAML = try YAMLEncoder.test.encode(mediaType)

                    expect(encodedMediaTypeYAML).to(equal(try mediaTypeYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Email media type") {
            beforeEach {
                mediaType = SpecMediaTypeSeeds.email
                mediaTypeYAML = SpecMediaTypeSeeds.emailYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedMediaType = try YAMLDecoder.test.decode(
                        SpecMediaType.self,
                        from: mediaTypeYAML
                    )

                    expect(decodedMediaType).to(equal(mediaType))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedMediaTypeYAML = try YAMLEncoder.test.encode(mediaType)

                    expect(encodedMediaTypeYAML).to(equal(try mediaTypeYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Languages media type") {
            beforeEach {
                mediaType = SpecMediaTypeSeeds.languages
                mediaTypeYAML = SpecMediaTypeSeeds.languagesYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedMediaType = try YAMLDecoder.test.decode(
                        SpecMediaType.self,
                        from: mediaTypeYAML
                    )

                    expect(decodedMediaType).to(equal(mediaType))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedMediaTypeYAML = try YAMLEncoder.test.encode(mediaType)

                    expect(encodedMediaTypeYAML).to(equal(try mediaTypeYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Location media type") {
            beforeEach {
                mediaType = SpecMediaTypeSeeds.location
                mediaTypeYAML = SpecMediaTypeSeeds.locationYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedMediaType = try YAMLDecoder.test.decode(
                        SpecMediaType.self,
                        from: mediaTypeYAML
                    )

                    expect(decodedMediaType).to(equal(mediaType))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedMediaTypeYAML = try YAMLEncoder.test.encode(mediaType)

                    expect(encodedMediaTypeYAML).to(equal(try mediaTypeYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("App info media type") {
            beforeEach {
                mediaType = SpecMediaTypeSeeds.appInfo
                mediaTypeYAML = SpecMediaTypeSeeds.appInfoYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedMediaType = try YAMLDecoder.test.decode(
                        SpecMediaType.self,
                        from: mediaTypeYAML
                    )

                    expect(decodedMediaType).to(equal(mediaType))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedMediaTypeYAML = try YAMLEncoder.test.encode(mediaType)

                    expect(encodedMediaTypeYAML).to(equal(try mediaTypeYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe(".extensions") {
            beforeEach {
                mediaType = SpecMediaTypeSeeds.appInfo
            }

            it("should return extensions") {
                expect(mediaType.extensions as? [String: Bool]).to(equal(["private": true]))
            }

            it("should modify extensions") {
                mediaType.extensions["private"] = false

                expect(mediaType.extensions as? [String: Bool]).to(equal(["private": false]))
            }
        }
    }
}
