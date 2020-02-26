import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SwaggerResponseSpec: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var response: SwaggerResponse!
        var responseYAML: String!

        describe("Empty response") {
            beforeEach {
                response = SwaggerResponseSeeds.empty
                responseYAML = SwaggerResponseSeeds.emptyYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedResponse = try YAMLDecoder.test.decode(
                        SwaggerResponse.self,
                        from: responseYAML
                    )

                    expect(decodedResponse).to(equal(response))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedResponseYAML = try YAMLEncoder.test.encode(response)

                    expect(encodedResponseYAML).to(equal(try responseYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Email response") {
            beforeEach {
                response = SwaggerResponseSeeds.email
                responseYAML = SwaggerResponseSeeds.emailYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedResponse = try YAMLDecoder.test.decode(
                        SwaggerResponse.self,
                        from: responseYAML
                    )

                    expect(decodedResponse).to(equal(response))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedResponseYAML = try YAMLEncoder.test.encode(response)

                    expect(encodedResponseYAML).to(equal(try responseYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("App info response") {
            beforeEach {
                response = SwaggerResponseSeeds.appInfo
                responseYAML = SwaggerResponseSeeds.appInfoYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedResponse = try YAMLDecoder.test.decode(
                        SwaggerResponse.self,
                        from: responseYAML
                    )

                    expect(decodedResponse).to(equal(response))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedResponseYAML = try YAMLEncoder.test.encode(response)

                    expect(encodedResponseYAML).to(equal(try responseYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe(".rawLinks") {
            beforeEach {
                response = SwaggerResponseSeeds.appInfo
            }

            it("should return raw links") {
                expect(response.rawLinks?["languages"]).toNot(beNil())
            }

            it("should modify raw links") {
                response.rawLinks?["medias"] = [
                    "medias": [
                        "operationId": "getAppMedias",
                        "parameters": ["uid": "$request.path.uid"]
                    ]
                ]

                expect(response.rawLinks?["medias"]).toNot(beNil())
            }
        }

        describe(".extensions") {
            beforeEach {
                response = SwaggerResponseSeeds.appInfo
            }

            it("should return extensions") {
                expect(response.extensions as? [String: Bool]).to(equal(["private": true]))
            }

            it("should modify extensions") {
                response.extensions["private"] = false

                expect(response.extensions as? [String: Bool]).to(equal(["private": false]))
            }
        }
    }
}
