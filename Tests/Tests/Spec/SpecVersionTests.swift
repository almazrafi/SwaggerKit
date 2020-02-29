import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

final class SpecVersionTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var version: SpecVersion!
        var versionYAML: String!

        describe("Full version") {
            beforeEach {
                version = SpecVersionSeeds.full
                versionYAML = SpecVersionSeeds.fullYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedVersion = try YAMLDecoder.test.decode(
                        SpecVersion.self,
                        from: versionYAML
                    )

                    expect(decodedVersion).to(equal(version))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedVersionYAML = try YAMLEncoder.test.encode(version)

                    expect(encodedVersionYAML).to(equal(try versionYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Version with major part only") {
            beforeEach {
                version = SpecVersionSeeds.majorOnly
                versionYAML = SpecVersionSeeds.majorOnlyYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedVersion = try YAMLDecoder.test.decode(
                        SpecVersion.self,
                        from: versionYAML
                    )

                    expect(decodedVersion).to(equal(version))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedVersionYAML = try YAMLEncoder.test.encode(version)

                    expect(encodedVersionYAML).to(equal(try SpecVersionSeeds.majorOnlyFullYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Version with invalid major part") {
            beforeEach {
                versionYAML = SpecVersionSeeds.invalidMajorYAML
            }

            it("should not be decoded") {
                do {
                    _ = try YAMLDecoder.test.decode(
                        SpecVersion.self,
                        from: versionYAML
                    )

                    fail("Test encountered unexpected behavior")
                } catch {
                    expect(error).to(beAKindOf(DecodingError.self))
                }
            }
        }

        describe("Version with invalid minor part") {
            beforeEach {
                versionYAML = SpecVersionSeeds.invalidMinorYAML
            }

            it("should not be decoded") {
                do {
                    _ = try YAMLDecoder.test.decode(
                        SpecVersion.self,
                        from: versionYAML
                    )

                    fail("Test encountered unexpected behavior")
                } catch {
                    expect(error).to(beAKindOf(DecodingError.self))
                }
            }
        }

        describe("Version with invalid patch") {
            beforeEach {
                versionYAML = SpecVersionSeeds.invalidPatchYAML
            }

            it("should not be decoded") {
                do {
                    _ = try YAMLDecoder.test.decode(
                        SpecVersion.self,
                        from: versionYAML
                    )

                    fail("Test encountered unexpected behavior")
                } catch {
                    expect(error).to(beAKindOf(DecodingError.self))
                }
            }
        }

        describe("Version 1.20.300") {
            beforeEach {
                version = SpecVersion(major: 1, minor: 2, patch: 3)
            }

            it("should be greater than 1.0.0") {
                expect(version).to(beGreaterThan(SpecVersion(major: 1, minor: 0, patch: 0)))
            }

            it("should be greater than 1.20.3") {
                expect(version).to(beGreaterThan(SpecVersion(major: 1, minor: 2, patch: 0)))
            }

            it("should not be greater than 1.20.300") {
                expect(version).toNot(beGreaterThan(SpecVersion(major: 1, minor: 2, patch: 3)))
            }

            it("should not be less than 1.20.300") {
                expect(version).toNot(beLessThan(SpecVersion(major: 1, minor: 2, patch: 3)))
            }

            it("should be less than 10.20.300") {
                expect(version).to(beLessThan(SpecVersion(major: 10, minor: 2, patch: 3)))
            }
        }

        describe(".description") {
            var versionDescription: String!

            beforeEach {
                version = SpecVersionSeeds.full
                versionDescription = SpecVersionSeeds.fullDescription
            }

            it("should return full string representation of the version number") {
                expect(version.description).to(equal(versionDescription))
            }
        }
    }
}
