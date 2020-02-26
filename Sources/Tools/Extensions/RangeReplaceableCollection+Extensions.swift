import Foundation

extension RangeReplaceableCollection {

    // MARK: - Instance Methods

    internal mutating func prepend<T: Collection>(contentsOf collection: T) where Self.Element == T.Element {
        insert(contentsOf: collection, at: startIndex)
    }

    internal mutating func prepend(_ element: Element) {
        insert(element, at: startIndex)
    }

    internal func prepending<T: Collection>(contentsOf collection: T) -> Self where Self.Element == T.Element {
        return collection + self
    }

    internal func prepending(_ element: Element) -> Self {
        return prepending(contentsOf: [element])
    }

    internal func appending<T: Collection>(contentsOf collection: T) -> Self where Self.Element == T.Element {
        return self + collection
    }

    internal func appending(_ element: Element) -> Self {
        return appending(contentsOf: [element])
    }
}
