import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

final class SpecSecurityRequirementTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var securityRequirement: SpecSecurityRequirement!
        var securityRequirementYAML: String!

        describe("Optional security requirement") {
            beforeEach {
                securityRequirement = SpecSecurityRequirementSeeds.optional
                securityRequirementYAML = SpecSecurityRequirementSeeds.optionalYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSecurityRequirement = try YAMLDecoder.test.decode(
                        SpecSecurityRequirement.self,
                        from: securityRequirementYAML
                    )

                    expect(decodedSecurityRequirement).to(equal(securityRequirement))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedSecurityRequirementYAML = try YAMLEncoder.test.encode(securityRequirement)

                    expect(encodedSecurityRequirementYAML).to(equal(try securityRequirementYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("OAuth2 security requirement") {
            beforeEach {
                securityRequirement = SpecSecurityRequirementSeeds.oauth2
                securityRequirementYAML = SpecSecurityRequirementSeeds.oauth2YAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSecurityRequirement = try YAMLDecoder.test.decode(
                        SpecSecurityRequirement.self,
                        from: securityRequirementYAML
                    )

                    expect(decodedSecurityRequirement).to(equal(securityRequirement))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedSecurityRequirementYAML = try YAMLEncoder.test.encode(securityRequirement)

                    expect(encodedSecurityRequirementYAML).to(equal(try securityRequirementYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Basic security requirement") {
            beforeEach {
                securityRequirement = SpecSecurityRequirementSeeds.basic
                securityRequirementYAML = SpecSecurityRequirementSeeds.basicYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSecurityRequirement = try YAMLDecoder.test.decode(
                        SpecSecurityRequirement.self,
                        from: securityRequirementYAML
                    )

                    expect(decodedSecurityRequirement).to(equal(securityRequirement))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedSecurityRequirementYAML = try YAMLEncoder.test.encode(securityRequirement)

                    expect(encodedSecurityRequirementYAML).to(equal(try securityRequirementYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }
    }
}
