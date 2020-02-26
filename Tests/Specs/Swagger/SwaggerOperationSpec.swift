import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SwaggerOperationSpec: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var operation: SwaggerOperation!
        var operationYAML: String!

        describe("GET app info operation") {
            beforeEach {
                operation = SwaggerOperationSeeds.getAppInfo
                operationYAML = SwaggerOperationSeeds.getAppInfoYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedOperation = try YAMLDecoder.test.decode(
                        SwaggerOperation.self,
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
                operation = SwaggerOperationSeeds.getApps
                operationYAML = SwaggerOperationSeeds.getAppsYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedOperation = try YAMLDecoder.test.decode(
                        SwaggerOperation.self,
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
                operation = SwaggerOperationSeeds.postApp
                operationYAML = SwaggerOperationSeeds.postAppYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedOperation = try YAMLDecoder.test.decode(
                        SwaggerOperation.self,
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
                operation = SwaggerOperationSeeds.postSubscription
                operationYAML = SwaggerOperationSeeds.postSubscriptionYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedOperation = try YAMLDecoder.test.decode(
                        SwaggerOperation.self,
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
                operation = SwaggerOperationSeeds.postSubscription
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
