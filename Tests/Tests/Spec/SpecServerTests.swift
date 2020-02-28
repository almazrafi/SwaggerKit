import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

final class SpecServerTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var server: SpecServer!
        var serverYAML: String!

        describe("Deprecated server") {
            beforeEach {
                server = SpecServerSeeds.deprecated
                serverYAML = SpecServerSeeds.deprecatedYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedServer = try YAMLDecoder.test.decode(
                        SpecServer.self,
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
                server = SpecServerSeeds.producation
                serverYAML = SpecServerSeeds.producationYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedServer = try YAMLDecoder.test.decode(
                        SpecServer.self,
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
                server = SpecServerSeeds.staging
                serverYAML = SpecServerSeeds.stagingYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedServer = try YAMLDecoder.test.decode(
                        SpecServer.self,
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
                server = SpecServerSeeds.staging
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
