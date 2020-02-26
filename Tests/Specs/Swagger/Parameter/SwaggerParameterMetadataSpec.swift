import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SwaggerParameterMetadataSpec: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var parameterMetadata: SwaggerParameterMetadata!
        var parameterMetadataYAML: String!

        describe("UID parameter metadata") {
            beforeEach {
                parameterMetadata = SwaggerParameterMetadataSeeds.uid
                parameterMetadataYAML = SwaggerParameterMetadataSeeds.uidYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedParameterMetadata = try YAMLDecoder.test.decode(
                        SwaggerParameterMetadata.self,
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
                parameterMetadata = SwaggerParameterMetadataSeeds.email
                parameterMetadataYAML = SwaggerParameterMetadataSeeds.emailYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedParameterMetadata = try YAMLDecoder.test.decode(
                        SwaggerParameterMetadata.self,
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
                parameterMetadata = SwaggerParameterMetadataSeeds.location
                parameterMetadataYAML = SwaggerParameterMetadataSeeds.locationYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedParameterMetadata = try YAMLDecoder.test.decode(
                        SwaggerParameterMetadata.self,
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
