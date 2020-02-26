import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SwaggerServerVariableSpec: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var serverVariable: SwaggerServerVariable!
        var serverVariableYAML: String!

        describe("Server path variable") {
            beforeEach {
                serverVariable = SwaggerServerVariableSeeds.path
                serverVariableYAML = SwaggerServerVariableSeeds.pathYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedServerVariable = try YAMLDecoder.test.decode(
                        SwaggerServerVariable.self,
                        from: serverVariableYAML
                    )

                    expect(decodedServerVariable).to(equal(serverVariable))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedServerVariableYAML = try YAMLEncoder.test.encode(serverVariable)

                    expect(encodedServerVariableYAML).to(equal(try serverVariableYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Server port variable") {
            beforeEach {
                serverVariable = SwaggerServerVariableSeeds.port
                serverVariableYAML = SwaggerServerVariableSeeds.portYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedServerVariable = try YAMLDecoder.test.decode(
                        SwaggerServerVariable.self,
                        from: serverVariableYAML
                    )

                    expect(decodedServerVariable).to(equal(serverVariable))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedServerVariableYAML = try YAMLEncoder.test.encode(serverVariable)

                    expect(encodedServerVariableYAML).to(equal(try serverVariableYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe(".extensions") {
            beforeEach {
                serverVariable = SwaggerServerVariableSeeds.port
                serverVariableYAML = SwaggerServerVariableSeeds.portYAML
            }

            it("should return extensions") {
                expect(serverVariable.extensions as? [String: Bool]).to(equal(["private": true]))
            }

            it("should modify extensions") {
                serverVariable.extensions["private"] = false

                expect(serverVariable.extensions as? [String: Bool]).to(equal(["private": false]))
            }
        }
    }
}
