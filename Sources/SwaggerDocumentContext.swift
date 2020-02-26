import Foundation

internal protocol SwaggerDocumentContext {

    // MARK: - Instance Methods

    func component<T: Codable>(at componentURI: String, document: SwaggerDocument) throws -> SwaggerComponent<T>
}
