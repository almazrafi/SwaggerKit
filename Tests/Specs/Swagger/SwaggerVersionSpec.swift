import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SwaggerVersionSpec: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var version: SwaggerVersion!
        var versionYAML: String!

        describe("Full version") {
            beforeEach {
                version = SwaggerVersionSeeds.full
                versionYAML = SwaggerVersionSeeds.fullYAML

                it("should be correctly decoded from YAML string") {
                    do {
                        let decodedVersion = try YAMLDecoder.test.decode(
                            SwaggerVersion.self,
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
        }

        describe("Version with major part only") {
            beforeEach {
                version = SwaggerVersionSeeds.majorOnly
                versionYAML = SwaggerVersionSeeds.majorOnlyYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedVersion = try YAMLDecoder.test.decode(
                        SwaggerVersion.self,
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

                    expect(encodedVersionYAML).to(equal(try SwaggerVersionSeeds.majorOnlyFullYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe("Version with invalid major part") {
            beforeEach {
                versionYAML = SwaggerVersionSeeds.invalidMajorYAML
            }

            it("should not be decoded") {
                do {
                    _ = try YAMLDecoder.test.decode(
                        SwaggerVersion.self,
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
                versionYAML = SwaggerVersionSeeds.invalidMinorYAML
            }

            it("should not be decoded") {
                do {
                    _ = try YAMLDecoder.test.decode(
                        SwaggerVersion.self,
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
                versionYAML = SwaggerVersionSeeds.invalidPatchYAML
            }

            it("should not be decoded") {
                do {
                    _ = try YAMLDecoder.test.decode(
                        SwaggerVersion.self,
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
                version = SwaggerVersion(major: 1, minor: 2, patch: 3)
            }

            it("should be greater than 1.0.0") {
                expect(version).to(beGreaterThan(SwaggerVersion(major: 1, minor: 0, patch: 0)))
            }

            it("should be greater than 1.20.3") {
                expect(version).to(beGreaterThan(SwaggerVersion(major: 1, minor: 2, patch: 0)))
            }

            it("should not be greater than 1.20.300") {
                expect(version).toNot(beGreaterThan(SwaggerVersion(major: 1, minor: 2, patch: 3)))
            }

            it("should not be less than 1.20.300") {
                expect(version).toNot(beLessThan(SwaggerVersion(major: 1, minor: 2, patch: 3)))
            }

            it("should be less than 10.20.300") {
                expect(version).to(beLessThan(SwaggerVersion(major: 10, minor: 2, patch: 3)))
            }
        }

        describe(".description") {
            var versionDescription: String!

            beforeEach {
                version = SwaggerVersionSeeds.full
                versionDescription = SwaggerVersionSeeds.fullDescription
            }

            it("should return full string representation of the version number") {
                expect(version.description).to(equal(versionDescription))
            }
        }
    }
}
