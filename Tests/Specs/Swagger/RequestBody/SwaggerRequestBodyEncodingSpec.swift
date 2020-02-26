import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SwaggerRequestBodyEncodingSpec: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var requestBodyEncoding: SwaggerRequestBodyEncoding!
        var requestBodyEncodingYAML: String!

        describe("Any request body encoding") {
            beforeEach {
                requestBodyEncoding = SwaggerRequestBodyEncodingSeeds.any
                requestBodyEncodingYAML = SwaggerRequestBodyEncodingSeeds.anyYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedRequestBodyEncoding = try YAMLDecoder.test.decode(
                        SwaggerRequestBodyEncoding.self,
                        from: requestBodyEncodingYAML
                    )

                    expect(decodedRequestBodyEncoding).to(equal(requestBodyEncoding))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedRequestBodyEncodingYAML = try YAMLEncoder.test.encode(requestBodyEncoding)

                    expect(encodedRequestBodyEncodingYAML).to(equal(try requestBodyEncodingYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Languages request body encoding") {
            beforeEach {
                requestBodyEncoding = SwaggerRequestBodyEncodingSeeds.languages
                requestBodyEncodingYAML = SwaggerRequestBodyEncodingSeeds.languagesYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedRequestBodyEncoding = try YAMLDecoder.test.decode(
                        SwaggerRequestBodyEncoding.self,
                        from: requestBodyEncodingYAML
                    )

                    expect(decodedRequestBodyEncoding).to(equal(requestBodyEncoding))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedRequestBodyEncodingYAML = try YAMLEncoder.test.encode(requestBodyEncoding)

                    expect(encodedRequestBodyEncodingYAML).to(equal(try requestBodyEncodingYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Image file request body encoding") {
            beforeEach {
                requestBodyEncoding = SwaggerRequestBodyEncodingSeeds.imageFile
                requestBodyEncodingYAML = SwaggerRequestBodyEncodingSeeds.imageFileYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedRequestBodyEncoding = try YAMLDecoder.test.decode(
                        SwaggerRequestBodyEncoding.self,
                        from: requestBodyEncodingYAML
                    )

                    expect(decodedRequestBodyEncoding).to(equal(requestBodyEncoding))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedRequestBodyEncodingYAML = try YAMLEncoder.test.encode(requestBodyEncoding)

                    expect(encodedRequestBodyEncodingYAML).to(equal(try requestBodyEncodingYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("App info request body encoding") {
            beforeEach {
                requestBodyEncoding = SwaggerRequestBodyEncodingSeeds.appInfo
                requestBodyEncodingYAML = SwaggerRequestBodyEncodingSeeds.appInfoYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedRequestBodyEncoding = try YAMLDecoder.test.decode(
                        SwaggerRequestBodyEncoding.self,
                        from: requestBodyEncodingYAML
                    )

                    expect(decodedRequestBodyEncoding).to(equal(requestBodyEncoding))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedRequestBodyEncodingYAML = try YAMLEncoder.test.encode(requestBodyEncoding)

                    expect(encodedRequestBodyEncodingYAML).to(equal(try requestBodyEncodingYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe(".extensions") {
            beforeEach {
                requestBodyEncoding = SwaggerRequestBodyEncodingSeeds.appInfo
            }

            it("should return extensions") {
                expect(requestBodyEncoding.extensions as? [String: Bool]).to(equal(["private": true]))
            }

            it("should modify extensions") {
                requestBodyEncoding.extensions["private"] = false

                expect(requestBodyEncoding.extensions as? [String: Bool]).to(equal(["private": false]))
            }
        }
    }
}
