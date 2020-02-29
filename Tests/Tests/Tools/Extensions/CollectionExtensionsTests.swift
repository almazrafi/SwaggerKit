import Foundation
import Quick
import Nimble

@testable import SwaggerKit

final class CollectionExtensionsTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        describe("Collection") {
            var collection: [Int]!

            beforeEach {
                collection = [1, 2, 3]
            }

            describe(".subscript(safe:)") {
                it("should return a value if the collection contains its index") {
                    expect(collection[safe: 2]).to(equal(3))
                }

                it("should return nil if the collection does not contain its index") {
                    expect(collection[safe: 3]).to(beNil())
                }
            }

            describe(".contains(index:)") {
                it("should return true if the collection contains the index") {
                    expect(collection.contains(index: 2)).to(beTrue())
                }

                it("should return false if the collection does not contain the index") {
                    expect(collection.contains(index: 3)).to(beFalse())
                }
            }
        }
    }
}
