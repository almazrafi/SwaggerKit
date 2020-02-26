import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SwaggerMediaTypeSpec: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var mediaType: SwaggerMediaType!
        var mediaTypeYAML: String!

        describe("UID media type") {
            beforeEach {
                mediaType = SwaggerMediaTypeSeeds.uid
                mediaTypeYAML = SwaggerMediaTypeSeeds.uidYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedMediaType = try YAMLDecoder.test.decode(
                        SwaggerMediaType.self,
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
                mediaType = SwaggerMediaTypeSeeds.email
                mediaTypeYAML = SwaggerMediaTypeSeeds.emailYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedMediaType = try YAMLDecoder.test.decode(
                        SwaggerMediaType.self,
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
                mediaType = SwaggerMediaTypeSeeds.languages
                mediaTypeYAML = SwaggerMediaTypeSeeds.languagesYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedMediaType = try YAMLDecoder.test.decode(
                        SwaggerMediaType.self,
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
                mediaType = SwaggerMediaTypeSeeds.location
                mediaTypeYAML = SwaggerMediaTypeSeeds.locationYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedMediaType = try YAMLDecoder.test.decode(
                        SwaggerMediaType.self,
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
                mediaType = SwaggerMediaTypeSeeds.appInfo
                mediaTypeYAML = SwaggerMediaTypeSeeds.appInfoYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedMediaType = try YAMLDecoder.test.decode(
                        SwaggerMediaType.self,
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
                mediaType = SwaggerMediaTypeSeeds.appInfo
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
