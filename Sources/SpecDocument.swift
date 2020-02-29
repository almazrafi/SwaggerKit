import Foundation

public final class SpecDocument {

    // MARK: - Nested Types

    internal typealias ReferenceResolver = (_ context: SpecDocumentContext) throws -> Void

    // MARK: - Instance Properties

    private var referenceResolvers: [ReferenceResolver] = []

    public let url: URL?
    public let codingPath: [String]

    public private(set) var components: [String: AnyObject] = [:]

    // MARK: - Initializers

    internal init(url: URL?, codingPath: [String]) {
        self.url = url
        self.codingPath = codingPath
    }

    // MARK: - Instance Methods

    internal func resolveReferences(with context: SpecDocumentContext) throws {
        while !referenceResolvers.isEmpty {
            let referenceResolver = referenceResolvers.removeFirst()

            try referenceResolver(context)
        }
    }

    internal func componentAbsoluteURI(_ uri: String) -> String? {
        guard !uri.isEmpty else {
            return url?.absoluteString
        }

        guard let percentEncodedURI = uri.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) else {
            return nil
        }

        return URL(
            string: percentEncodedURI.replacingOccurrences(of: "%23/", with: "#/"),
            relativeTo: url
        )?.absoluteString
    }
}

extension SpecDocument: SpecComponentRegistry {

    // MARK: - Instance Methods

    internal func registerComponent<T: Codable>(_ component: SpecComponent<T>, at codingPath: [CodingKey]) {
        let componentURI = codingPath.isEmpty ? "" : codingPath.reduce(into: "#") { componentURI, codingKey in
            componentURI.append("/\(codingKey.stringValue)")
        }

        components[componentURI] = component
    }
}

extension SpecDocument: SpecReferenceRegistry {

    // MARK: - Instance Methods

    internal func registerReference<T: Codable>(_ reference: SpecReference<T>) {
        let referenceResolver: ReferenceResolver = { [weak self, weak reference] context in
            guard let self = self, let reference = reference else {
                return
            }

            reference.resolve(with: try context.component(at: reference.uri, document: self))
        }

        referenceResolvers.append(referenceResolver)
    }
}
