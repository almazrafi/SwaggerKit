import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SpecLicenseInfoTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var licenseInfo: SpecLicenseInfo!
        var licenseInfoYAML: String!

        describe("License Info") {
            beforeEach {
                licenseInfo = SpecLicenseInfoSeeds.example
                licenseInfoYAML = SpecLicenseInfoSeeds.exampleYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedLicenseInfo = try YAMLDecoder.test.decode(
                        SpecLicenseInfo.self,
                        from: licenseInfoYAML
                    )

                    expect(decodedLicenseInfo).to(equal(licenseInfo))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }

            it("should be correctly encoded to YAML string") {
                do {
                    let encodedLicenseInfoYAML = try YAMLEncoder.test.encode(licenseInfo)

                    expect(encodedLicenseInfoYAML).to(equal(try licenseInfoYAML.yamlSorted()))
                } catch {
                    fail("Test encountered unexpected error: \(error)")
                }
            }
        }

        describe(".extensions") {
            beforeEach {
                licenseInfo = SpecLicenseInfoSeeds.example
            }

            it("should return extensions") {
                expect(licenseInfo.extensions as? [String: Bool]).to(equal(["private": true]))
            }

            it("should modify extensions") {
                licenseInfo.extensions["private"] = false

                expect(licenseInfo.extensions as? [String: Bool]).to(equal(["private": false]))
            }
        }
    }
}
