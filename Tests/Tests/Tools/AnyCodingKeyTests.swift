import Foundation
import Quick
import Nimble

@testable import SwaggerKit

class AnyCodingKeyTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        describe(".init(_:)") {
            it("should create a new non-optional instance with the given string key") {
                let codingKey = AnyCodingKey("foo")

                expect(codingKey.stringValue).to(equal("foo"))
                expect(codingKey.intValue).to(beNil())
            }
        }

        describe(".init(_:)") {
            it("should create a new non-optional instance with the given integer key") {
                let codingKey = AnyCodingKey(123)

                expect(codingKey.stringValue).to(equal("123"))
                expect(codingKey.intValue).to(equal(123))
            }
        }

        describe(".init?(stringValue:)") {
            it("should create a new optional instance with the given string key") {
                let codingKey = AnyCodingKey(stringValue: "foo")

                expect(codingKey?.stringValue).to(equal("foo"))
                expect(codingKey?.intValue).to(beNil())
            }
        }

        describe(".init?(intValue:)") {
            it("should create a new optional instance with the given integer key") {
                let codingKey = AnyCodingKey(intValue: 123)

                expect(codingKey?.stringValue).to(equal("123"))
                expect(codingKey?.intValue).to(equal(123))
            }
        }
    }
}
