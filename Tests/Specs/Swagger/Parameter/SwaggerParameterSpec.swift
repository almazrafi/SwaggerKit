import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SwaggerParameterSpec: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var parameter: SwaggerParameter!
        var parameterYAML: String!

        describe("UID parameter") {
            beforeEach {
                parameter = SwaggerParameterSeeds.uid
                parameterYAML = SwaggerParameterSeeds.uidYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedParameter = try YAMLDecoder.test.decode(
                        SwaggerParameter.self,
                        from: parameterYAML
                    )

                    expect(decodedParameter).to(equal(parameter))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedParameterYAML = try YAMLEncoder.test.encode(parameter)

                    expect(encodedParameterYAML).to(equal(try parameterYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Email parameter") {
            beforeEach {
                parameter = SwaggerParameterSeeds.email
                parameterYAML = SwaggerParameterSeeds.emailYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedParameter = try YAMLDecoder.test.decode(
                        SwaggerParameter.self,
                        from: parameterYAML
                    )

                    expect(decodedParameter).to(equal(parameter))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedParameterYAML = try YAMLEncoder.test.encode(parameter)

                    expect(encodedParameterYAML).to(equal(try parameterYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Location parameter") {
            beforeEach {
                parameter = SwaggerParameterSeeds.location
                parameterYAML = SwaggerParameterSeeds.locationYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedParameter = try YAMLDecoder.test.decode(
                        SwaggerParameter.self,
                        from: parameterYAML
                    )

                    expect(decodedParameter).to(equal(parameter))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedParameterYAML = try YAMLEncoder.test.encode(parameter)

                    expect(encodedParameterYAML).to(equal(try parameterYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe(".extensions") {
            beforeEach {
                parameter = SwaggerParameterSeeds.location
            }

            it("should return extensions") {
                expect(parameter.extensions as? [String: Bool]).to(equal(["private": true]))
            }

            it("should modify extensions") {
                parameter.extensions["private"] = false

                expect(parameter.extensions as? [String: Bool]).to(equal(["private": false]))
            }
        }
    }
}
