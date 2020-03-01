import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

final class SpecPathOperationTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var operation: SpecPathOperation!
        var operationYAML: String!

        describe("GET app info operation") {
            beforeEach {
                operation = SpecPathOperationSeeds.getAppInfo
                operationYAML = SpecPathOperationSeeds.getAppInfoYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedOperation = try YAMLDecoder.test.decode(
                        SpecPathOperation.self,
                        from: operationYAML
                    )

                    expect(decodedOperation).to(equal(operation))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedOperationYAML = try YAMLEncoder.test.encode(operation)

                    expect(encodedOperationYAML).to(equal(try operationYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("GET apps operation") {
            beforeEach {
                operation = SpecPathOperationSeeds.getApps
                operationYAML = SpecPathOperationSeeds.getAppsYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedOperation = try YAMLDecoder.test.decode(
                        SpecPathOperation.self,
                        from: operationYAML
                    )

                    expect(decodedOperation).to(equal(operation))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedOperationYAML = try YAMLEncoder.test.encode(operation)

                    expect(encodedOperationYAML).to(equal(try operationYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("POST app operation") {
            beforeEach {
                operation = SpecPathOperationSeeds.postApp
                operationYAML = SpecPathOperationSeeds.postAppYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedOperation = try YAMLDecoder.test.decode(
                        SpecPathOperation.self,
                        from: operationYAML
                    )

                    expect(decodedOperation).to(equal(operation))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedOperationYAML = try YAMLEncoder.test.encode(operation)

                    expect(encodedOperationYAML).to(equal(try operationYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("POST subscription operation") {
            beforeEach {
                operation = SpecPathOperationSeeds.postSubscription
                operationYAML = SpecPathOperationSeeds.postSubscriptionYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedOperation = try YAMLDecoder.test.decode(
                        SpecPathOperation.self,
                        from: operationYAML
                    )

                    expect(decodedOperation).to(equal(operation))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedOperationYAML = try YAMLEncoder.test.encode(operation)

                    expect(encodedOperationYAML).to(equal(try operationYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe(".extensions") {
            beforeEach {
                operation = SpecPathOperationSeeds.postSubscription
            }

            it("should return extensions") {
                expect(operation.extensions as? [String: Bool]).to(equal(["private": true]))
            }

            it("should modify extensions") {
                operation.extensions["private"] = false

                expect(operation.extensions as? [String: Bool]).to(equal(["private": false]))
            }
        }
    }
}
