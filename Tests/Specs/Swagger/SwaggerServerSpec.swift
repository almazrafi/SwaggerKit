import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SwaggerServerSpec: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var server: SwaggerServer!
        var serverYAML: String!

        describe("Deprecated server") {
            beforeEach {
                server = SwaggerServerSeeds.deprecated
                serverYAML = SwaggerServerSeeds.deprecatedYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedServer = try YAMLDecoder.test.decode(
                        SwaggerServer.self,
                        from: serverYAML
                    )

                    expect(decodedServer).to(equal(server))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedServerYAML = try YAMLEncoder.test.encode(server)

                    expect(encodedServerYAML).to(equal(try serverYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Producation server") {
            beforeEach {
                server = SwaggerServerSeeds.producation
                serverYAML = SwaggerServerSeeds.producationYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedServer = try YAMLDecoder.test.decode(
                        SwaggerServer.self,
                        from: serverYAML
                    )

                    expect(decodedServer).to(equal(server))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedServerYAML = try YAMLEncoder.test.encode(server)

                    expect(encodedServerYAML).to(equal(try serverYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Staging server") {
            beforeEach {
                server = SwaggerServerSeeds.staging
                serverYAML = SwaggerServerSeeds.stagingYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedServer = try YAMLDecoder.test.decode(
                        SwaggerServer.self,
                        from: serverYAML
                    )

                    expect(decodedServer).to(equal(server))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedServerYAML = try YAMLEncoder.test.encode(server)

                    expect(encodedServerYAML).to(equal(try serverYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe(".extensions") {
            beforeEach {
                server = SwaggerServerSeeds.staging
            }

            it("should return extensions") {
                expect(server.extensions as? [String: Bool]).to(equal(["private": true]))
            }

            it("should modify extensions") {
                server.extensions["private"] = false

                expect(server.extensions as? [String: Bool]).to(equal(["private": false]))
            }
        }
    }
}
