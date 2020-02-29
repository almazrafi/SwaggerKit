import Foundation

public protocol Changeable {

    // MARK: - Instance Methods

    func changing(_ change: (inout Self) -> Void) -> Self
}

extension Changeable {

    // MARK: - Instance Methods

    public func changing(_ change: (inout Self) -> Void) -> Self {
        var instance = self

        change(&instance)

        return instance
    }
}
