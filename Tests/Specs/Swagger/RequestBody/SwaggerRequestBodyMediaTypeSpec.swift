import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SwaggerRequestBodyMediaTypeSpec: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var requestBodyMediaType: SwaggerRequestBodyMediaType!
        var requestBodyMediaTypeYAML: String!

        describe("Any request body media type") {
            beforeEach {
                requestBodyMediaType = SwaggerRequestBodyMediaTypeSeeds.any
                requestBodyMediaTypeYAML = SwaggerRequestBodyMediaTypeSeeds.anyYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedRequestBodyMediaType = try YAMLDecoder.test.decode(
                        SwaggerRequestBodyMediaType.self,
                        from: requestBodyMediaTypeYAML
                    )

                    expect(decodedRequestBodyMediaType).to(equal(requestBodyMediaType))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedRequestBodyMediaTypeYAML = try YAMLEncoder.test.encode(requestBodyMediaType)

                    expect(encodedRequestBodyMediaTypeYAML).to(equal(try requestBodyMediaTypeYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Languages request body media type") {
            beforeEach {
                requestBodyMediaType = SwaggerRequestBodyMediaTypeSeeds.languages
                requestBodyMediaTypeYAML = SwaggerRequestBodyMediaTypeSeeds.languagesYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedRequestBodyMediaType = try YAMLDecoder.test.decode(
                        SwaggerRequestBodyMediaType.self,
                        from: requestBodyMediaTypeYAML
                    )

                    expect(decodedRequestBodyMediaType).to(equal(requestBodyMediaType))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedRequestBodyMediaTypeYAML = try YAMLEncoder.test.encode(requestBodyMediaType)

                    expect(encodedRequestBodyMediaTypeYAML).to(equal(try requestBodyMediaTypeYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Image file request body media type") {
            beforeEach {
                requestBodyMediaType = SwaggerRequestBodyMediaTypeSeeds.imageFile
                requestBodyMediaTypeYAML = SwaggerRequestBodyMediaTypeSeeds.imageFileYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedRequestBodyMediaType = try YAMLDecoder.test.decode(
                        SwaggerRequestBodyMediaType.self,
                        from: requestBodyMediaTypeYAML
                    )

                    expect(decodedRequestBodyMediaType).to(equal(requestBodyMediaType))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedRequestBodyMediaTypeYAML = try YAMLEncoder.test.encode(requestBodyMediaType)

                    expect(encodedRequestBodyMediaTypeYAML).to(equal(try requestBodyMediaTypeYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("App info request body media type") {
            beforeEach {
                requestBodyMediaType = SwaggerRequestBodyMediaTypeSeeds.appInfo
                requestBodyMediaTypeYAML = SwaggerRequestBodyMediaTypeSeeds.appInfoYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedRequestBodyMediaType = try YAMLDecoder.test.decode(
                        SwaggerRequestBodyMediaType.self,
                        from: requestBodyMediaTypeYAML
                    )

                    expect(decodedRequestBodyMediaType).to(equal(requestBodyMediaType))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedRequestBodyMediaTypeYAML = try YAMLEncoder.test.encode(requestBodyMediaType)

                    expect(encodedRequestBodyMediaTypeYAML).to(equal(try requestBodyMediaTypeYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe(".extensions") {
            beforeEach {
                requestBodyMediaType = SwaggerRequestBodyMediaTypeSeeds.appInfo
            }

            it("should return extensions") {
                expect(requestBodyMediaType.extensions as? [String: Bool]).to(equal(["private": true]))
            }

            it("should modify extensions") {
                requestBodyMediaType.extensions["private"] = false

                expect(requestBodyMediaType.extensions as? [String: Bool]).to(equal(["private": false]))
            }
        }
    }
}
