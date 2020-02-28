import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SpecParameterMetadataTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var parameterMetadata: SpecParameterMetadata!
        var parameterMetadataYAML: String!

        describe("UID parameter metadata") {
            beforeEach {
                parameterMetadata = SpecParameterMetadataSeeds.uid
                parameterMetadataYAML = SpecParameterMetadataSeeds.uidYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedParameterMetadata = try YAMLDecoder.test.decode(
                        SpecParameterMetadata.self,
                        from: parameterMetadataYAML
                    )

                    expect(decodedParameterMetadata).to(equal(parameterMetadata))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedParameterMetadataYAML = try YAMLEncoder.test.encode(parameterMetadata)

                    expect(encodedParameterMetadataYAML).to(equal(try parameterMetadataYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Email parameter metadata") {
            beforeEach {
                parameterMetadata = SpecParameterMetadataSeeds.email
                parameterMetadataYAML = SpecParameterMetadataSeeds.emailYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedParameterMetadata = try YAMLDecoder.test.decode(
                        SpecParameterMetadata.self,
                        from: parameterMetadataYAML
                    )

                    expect(decodedParameterMetadata).to(equal(parameterMetadata))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedParameterMetadataYAML = try YAMLEncoder.test.encode(parameterMetadata)

                    expect(encodedParameterMetadataYAML).to(equal(try parameterMetadataYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Location parameter metadata") {
            beforeEach {
                parameterMetadata = SpecParameterMetadataSeeds.location
                parameterMetadataYAML = SpecParameterMetadataSeeds.locationYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedParameterMetadata = try YAMLDecoder.test.decode(
                        SpecParameterMetadata.self,
                        from: parameterMetadataYAML
                    )

                    expect(decodedParameterMetadata).to(equal(parameterMetadata))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedParameterMetadataYAML = try YAMLEncoder.test.encode(parameterMetadata)

                    expect(encodedParameterMetadataYAML).to(equal(try parameterMetadataYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }
    }
}
