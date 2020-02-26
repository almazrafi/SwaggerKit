import Foundation

extension Dictionary where Value: RangeReplaceableCollection {

    // MARK: - Instance Methods

    @discardableResult
    internal mutating func append<T: Collection>(
        contentsOf collection: T,
        toCollectionOfKey key: Key
    ) -> Value where Value.Element == T.Element {
        let value = self[key] ?? Value()

        self[key] = value.appending(contentsOf: collection)

        return value
    }

    @discardableResult
    internal mutating func append(_ element: Value.Iterator.Element, toCollectionOfKey key: Key) -> Value {
        let value = self[key] ?? Value()

        self[key] = value.appending(element)

        return value
    }

    @discardableResult
    internal mutating func prepend<T: Collection>(
        contentsOf collection: T,
        toCollectionOfKey key: Key
    ) -> Value where Value.Element == T.Element {
        let value = self[key] ?? Value()

        self[key] = value.prepending(contentsOf: collection)

        return value
    }

    @discardableResult
    internal mutating func prepend(_ element: Value.Iterator.Element, toCollectionOfKey key: Key) -> Value {
        let value = self[key] ?? Value()

        self[key] = value.prepending(element)

        return value
    }

    internal mutating func appending<T: Collection>(
        contentsOf collection: T,
        toCollectionOfKey key: Key
    ) -> Dictionary where Value.Element == T.Element {
        var dictionary = self

        dictionary.append(contentsOf: collection, toCollectionOfKey: key)

        return dictionary
    }

    internal mutating func appending(_ element: Value.Iterator.Element, toCollectionOfKey key: Key) -> Dictionary {
        var dictionary = self

        dictionary.append(element, toCollectionOfKey: key)

        return dictionary
    }

    internal mutating func prepending<T: Collection>(
        contentsOf collection: T,
        toCollectionOfKey key: Key
    ) -> Dictionary where Value.Element == T.Element {
        var dictionary = self

        dictionary.prepend(contentsOf: collection, toCollectionOfKey: key)

        return dictionary
    }

    internal mutating func prepending(_ element: Value.Iterator.Element, toCollectionOfKey key: Key) -> Dictionary {
        var dictionary = self

        dictionary.prepend(element, toCollectionOfKey: key)

        return dictionary
    }
}
