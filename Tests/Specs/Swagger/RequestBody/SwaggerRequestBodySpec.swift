import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SwaggerRequestBodySpec: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var requestBody: SwaggerRequestBody!
        var requestBodyYAML: String!

        describe("Languages request body") {
            beforeEach {
                requestBody = SwaggerRequestBodySeeds.languages
                requestBodyYAML = SwaggerRequestBodySeeds.languagesYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedRequestBody = try YAMLDecoder.test.decode(
                        SwaggerRequestBody.self,
                        from: requestBodyYAML
                    )

                    expect(decodedRequestBody).to(equal(requestBody))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedRequestBodyYAML = try YAMLEncoder.test.encode(requestBody)

                    expect(encodedRequestBodyYAML).to(equal(try requestBodyYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Image file request body") {
            beforeEach {
                requestBody = SwaggerRequestBodySeeds.imageFile
                requestBodyYAML = SwaggerRequestBodySeeds.imageFileYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedRequestBody = try YAMLDecoder.test.decode(
                        SwaggerRequestBody.self,
                        from: requestBodyYAML
                    )

                    expect(decodedRequestBody).to(equal(requestBody))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedRequestBodyYAML = try YAMLEncoder.test.encode(requestBody)

                    expect(encodedRequestBodyYAML).to(equal(try requestBodyYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("App info request body") {
            beforeEach {
                requestBody = SwaggerRequestBodySeeds.appInfo
                requestBodyYAML = SwaggerRequestBodySeeds.appInfoYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedRequestBody = try YAMLDecoder.test.decode(
                        SwaggerRequestBody.self,
                        from: requestBodyYAML
                    )

                    expect(decodedRequestBody).to(equal(requestBody))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedRequestBodyYAML = try YAMLEncoder.test.encode(requestBody)

                    expect(encodedRequestBodyYAML).to(equal(try requestBodyYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe(".extensions") {
            beforeEach {
                requestBody = SwaggerRequestBodySeeds.appInfo
            }

            it("should return extensions") {
                expect(requestBody.extensions as? [String: Bool]).to(equal(["private": true]))
            }

            it("should modify extensions") {
                requestBody.extensions["private"] = false

                expect(requestBody.extensions as? [String: Bool]).to(equal(["private": false]))
            }
        }
    }
}
