import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

final class SpecRequestBodyEncodingTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var requestBodyEncoding: SpecRequestBodyEncoding!
        var requestBodyEncodingYAML: String!

        describe("Any request body encoding") {
            beforeEach {
                requestBodyEncoding = SpecRequestBodyEncodingSeeds.any
                requestBodyEncodingYAML = SpecRequestBodyEncodingSeeds.anyYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedRequestBodyEncoding = try YAMLDecoder.test.decode(
                        SpecRequestBodyEncoding.self,
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
                requestBodyEncoding = SpecRequestBodyEncodingSeeds.languages
                requestBodyEncodingYAML = SpecRequestBodyEncodingSeeds.languagesYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedRequestBodyEncoding = try YAMLDecoder.test.decode(
                        SpecRequestBodyEncoding.self,
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
                requestBodyEncoding = SpecRequestBodyEncodingSeeds.imageFile
                requestBodyEncodingYAML = SpecRequestBodyEncodingSeeds.imageFileYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedRequestBodyEncoding = try YAMLDecoder.test.decode(
                        SpecRequestBodyEncoding.self,
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
                requestBodyEncoding = SpecRequestBodyEncodingSeeds.appInfo
                requestBodyEncodingYAML = SpecRequestBodyEncodingSeeds.appInfoYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedRequestBodyEncoding = try YAMLDecoder.test.decode(
                        SpecRequestBodyEncoding.self,
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
                requestBodyEncoding = SpecRequestBodyEncodingSeeds.appInfo
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
