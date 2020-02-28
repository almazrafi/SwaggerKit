import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SpecParameterTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var parameter: SpecParameter!
        var parameterYAML: String!

        describe("UID parameter") {
            beforeEach {
                parameter = SpecParameterSeeds.uid
                parameterYAML = SpecParameterSeeds.uidYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedParameter = try YAMLDecoder.test.decode(
                        SpecParameter.self,
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
                parameter = SpecParameterSeeds.email
                parameterYAML = SpecParameterSeeds.emailYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedParameter = try YAMLDecoder.test.decode(
                        SpecParameter.self,
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
                parameter = SpecParameterSeeds.location
                parameterYAML = SpecParameterSeeds.locationYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedParameter = try YAMLDecoder.test.decode(
                        SpecParameter.self,
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
                parameter = SpecParameterSeeds.location
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
