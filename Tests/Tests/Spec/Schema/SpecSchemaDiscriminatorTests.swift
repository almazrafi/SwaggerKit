import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

final class SpecSchemaDiscriminatorTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var schemaDiscriminator: SpecSchemaDiscriminator!
        var schemaDiscriminatorYAML: String!

        describe("Media type schema discriminator") {
            beforeEach {
                schemaDiscriminator = SpecSchemaDiscriminatorSeeds.mediaType
                schemaDiscriminatorYAML = SpecSchemaDiscriminatorSeeds.mediaTypeYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedSchemaDiscriminator = try YAMLDecoder.test.decode(
                        SpecSchemaDiscriminator.self,
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
                schemaDiscriminator = SpecSchemaDiscriminatorSeeds.mediaType
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
