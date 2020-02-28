import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SpecRequestBodyTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var requestBody: SpecRequestBody!
        var requestBodyYAML: String!

        describe("Languages request body") {
            beforeEach {
                requestBody = SpecRequestBodySeeds.languages
                requestBodyYAML = SpecRequestBodySeeds.languagesYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedRequestBody = try YAMLDecoder.test.decode(
                        SpecRequestBody.self,
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
                requestBody = SpecRequestBodySeeds.imageFile
                requestBodyYAML = SpecRequestBodySeeds.imageFileYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedRequestBody = try YAMLDecoder.test.decode(
                        SpecRequestBody.self,
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
                requestBody = SpecRequestBodySeeds.appInfo
                requestBodyYAML = SpecRequestBodySeeds.appInfoYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedRequestBody = try YAMLDecoder.test.decode(
                        SpecRequestBody.self,
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
                requestBody = SpecRequestBodySeeds.appInfo
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
