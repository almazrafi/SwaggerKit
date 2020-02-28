import Foundation

import Quick
import Nimble

@testable import SwaggerKit

final class StringExtensionsTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        describe(".suffix(from:)") {
            it("should return an empty string") {
                let string = ""

                expect(string.suffix(from: -1)).to(beEmpty())
            }

            it("should return an empty string") {
                let string = ""

                expect(string.suffix(from: 0)).to(beEmpty())
            }

            it("should return an empty string") {
                let string = ""

                expect(string.suffix(from: 1)).to(beEmpty())
            }

            it("should return a string suffix") {
                let string = "123456"

                expect(string.suffix(from: -1)).to(equal("123456"))
            }

            it("should return a string suffix") {
                let string = "123456"

                expect(string.suffix(from: 0)).to(equal("123456"))
            }

            it("should return a string suffix") {
                let string = "123456"

                expect(string.suffix(from: 5)).to(equal("6"))
            }

            it("should return a string suffix") {
                let string = "123456"

                expect(string.suffix(from: 6)).to(beEmpty())
            }

            it("should return a string suffix") {
                let string = "123456"

                expect(string.suffix(from: 7)).to(beEmpty())
            }
        }
    }
}
