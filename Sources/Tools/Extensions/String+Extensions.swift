import Foundation

extension String {

    // MARK: - Instance Methods

    internal func suffix(from index: Int) -> String {
        return String(suffix(from: self.index(startIndex, offsetBy: max(0, min(index, count)))))
    }
}
