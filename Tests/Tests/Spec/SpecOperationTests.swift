import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

final class SpecOperationTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var operation: SpecOperation!
        var operationYAML: String!

        describe("GET app info operation") {
            beforeEach {
                operation = SpecOperationSeeds.getAppInfo
                operationYAML = SpecOperationSeeds.getAppInfoYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedOperation = try YAMLDecoder.test.decode(
                        SpecOperation.self,
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
                operation = SpecOperationSeeds.getApps
                operationYAML = SpecOperationSeeds.getAppsYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedOperation = try YAMLDecoder.test.decode(
                        SpecOperation.self,
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
                operation = SpecOperationSeeds.postApp
                operationYAML = SpecOperationSeeds.postAppYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedOperation = try YAMLDecoder.test.decode(
                        SpecOperation.self,
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
                operation = SpecOperationSeeds.postSubscription
                operationYAML = SpecOperationSeeds.postSubscriptionYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedOperation = try YAMLDecoder.test.decode(
                        SpecOperation.self,
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
                operation = SpecOperationSeeds.postSubscription
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
