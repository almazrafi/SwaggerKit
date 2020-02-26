import Foundation
import Yams
import Quick
import Nimble

@testable import SwaggerKit

class SwaggerLicenseInfoSpec: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var licenseInfo: SwaggerLicenseInfo!
        var licenseInfoYAML: String!

        describe("License Info") {
            beforeEach {
                licenseInfo = SwaggerLicenseInfoSeeds.example
                licenseInfoYAML = SwaggerLicenseInfoSeeds.exampleYAML
            }

            it("should be correctly decoded from YAML string") {
                do {
                    let decodedLicenseInfo = try YAMLDecoder.test.decode(
                        SwaggerLicenseInfo.self,
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
                licenseInfo = SwaggerLicenseInfoSeeds.example
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
