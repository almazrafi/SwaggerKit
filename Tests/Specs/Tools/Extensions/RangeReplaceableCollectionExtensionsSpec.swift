import Foundation
import Quick
import Nimble

@testable import SwaggerKit

class RangeReplaceableCollectionExtensionsSpec: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        describe("RangeReplaceableCollection") {
            var collection: [Int]!

            beforeEach {
                collection = [1, 2, 3]
            }

            describe(".prepend(contentsOf:)") {
                it("should prepend the elements of a sequence to the collection") {
                    collection.prepend(contentsOf: [4, 5, 6])

                    expect(collection).to(equal([4, 5, 6, 1, 2, 3]))
                }
            }

            describe(".prepend(_:)") {
                it("should prepend a new element to the collection") {
                    collection.prepend(456)

                    expect(collection).to(equal([456, 1, 2, 3]))
                }
            }

            describe(".prepending(contentsOf:)") {
                it("should return a copy of the collection with the prepended sequence elements") {
                    let newCollection = collection.prepending(contentsOf: [4, 5, 6])

                    expect(newCollection).to(equal([4, 5, 6, 1, 2, 3]))
                }
            }

            describe(".prepending(_:)") {
                it("should return a copy of the collection with the prepended element") {
                    let newCollection = collection.prepending(456)

                    expect(newCollection).to(equal([456, 1, 2, 3]))
                }
            }

            describe(".appending(contentsOf:)") {
                it("should return a copy of the collection with the appended sequence elements") {
                    let newCollection = collection.appending(contentsOf: [4, 5, 6])

                    expect(newCollection).to(equal([1, 2, 3, 4, 5, 6]))
                }
            }

            describe(".appending(_:)") {
                it("should return a copy of the collection with the appended element") {
                    let newCollection = collection.appending(456)

                    expect(newCollection).to(equal([1, 2, 3, 456]))
                }
            }
        }
    }
}
