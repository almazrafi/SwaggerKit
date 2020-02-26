import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SwaggerSchemaDiscriminatorSpec: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var schemaDiscriminator: SwaggerSchemaDiscriminator!
        var schemaDiscriminatorYAML: String!

        describe("Media type schema discriminator") {
            beforeEach {
                schemaDiscriminator = SwaggerSchemaDiscriminatorSeeds.mediaType
                schemaDiscriminatorYAML = SwaggerSchemaDiscriminatorSeeds.mediaTypeYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchemaDiscriminator = try YAMLDecoder.test.decode(
                        SwaggerSchemaDiscriminator.self,
                        from: schemaDiscriminatorYAML
                    )

                    expect(decodedSchemaDiscriminator).to(equal(schemaDiscriminator))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedSchemaDiscriminatorYAML = try YAMLEncoder.test.encode(schemaDiscriminator)

                    expect(encodedSchemaDiscriminatorYAML).to(equal(try schemaDiscriminatorYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe(".extensions") {
            beforeEach {
                schemaDiscriminator = SwaggerSchemaDiscriminatorSeeds.mediaType
            }

            it("should return extensions") {
                expect(schemaDiscriminator.extensions as? [String: Bool]).to(equal(["private": true]))
            }

            it("should modify extensions") {
                schemaDiscriminator.extensions["private"] = false

                expect(schemaDiscriminator.extensions as? [String: Bool]).to(equal(["private": false]))
            }
        }
    }
}
