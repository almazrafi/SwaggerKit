import Foundation

internal protocol SpecDocumentContext {

    // MARK: - Instance Methods

    func component<T: Codable>(at componentURI: String, document: SpecDocument) throws -> SpecComponent<T>
}
