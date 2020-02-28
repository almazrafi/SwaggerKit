import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SpecRequestBodyMediaTypeTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var requestBodyMediaType: SpecRequestBodyMediaType!
        var requestBodyMediaTypeYAML: String!

        describe("Any request body media type") {
            beforeEach {
                requestBodyMediaType = SpecRequestBodyMediaTypeSeeds.any
                requestBodyMediaTypeYAML = SpecRequestBodyMediaTypeSeeds.anyYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedRequestBodyMediaType = try YAMLDecoder.test.decode(
                        SpecRequestBodyMediaType.self,
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
                requestBodyMediaType = SpecRequestBodyMediaTypeSeeds.languages
                requestBodyMediaTypeYAML = SpecRequestBodyMediaTypeSeeds.languagesYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedRequestBodyMediaType = try YAMLDecoder.test.decode(
                        SpecRequestBodyMediaType.self,
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
                requestBodyMediaType = SpecRequestBodyMediaTypeSeeds.imageFile
                requestBodyMediaTypeYAML = SpecRequestBodyMediaTypeSeeds.imageFileYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedRequestBodyMediaType = try YAMLDecoder.test.decode(
                        SpecRequestBodyMediaType.self,
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
                requestBodyMediaType = SpecRequestBodyMediaTypeSeeds.appInfo
                requestBodyMediaTypeYAML = SpecRequestBodyMediaTypeSeeds.appInfoYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedRequestBodyMediaType = try YAMLDecoder.test.decode(
                        SpecRequestBodyMediaType.self,
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
                requestBodyMediaType = SpecRequestBodyMediaTypeSeeds.appInfo
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
