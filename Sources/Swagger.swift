import Foundation

public class Swagger {

    // MARK: - Instance Properties

    public private(set) var allDocuments: [SwaggerDocument] = []
    public private(set) var allComponents: [String: Any] = [:]

    public let specDocument: SwaggerDocument
    public let spec: SwaggerSpec

    // MARK: - Initializers

    private init(specDocumentNode: SwaggerDocumentNode<SwaggerSpec>) throws {
        specDocument = specDocumentNode.document
        spec = specDocumentNode.value

        try resolveReferences(of: specDocument)
    }

    public convenience init(content: String, url: URL? = nil) throws {
        try self.init(specDocumentNode: try SwaggerDocumentNode<SwaggerSpec>(content: content, url: url))
    }

    public convenience init(data: Data, url: URL? = nil) throws {
        try self.init(specDocumentNode: try SwaggerDocumentNode<SwaggerSpec>(data: data, url: url))
    }

    public convenience init(url: URL) throws {
        try self.init(specDocumentNode: try SwaggerDocumentNode<SwaggerSpec>(url: url))
    }

    public convenience init(filePath: String) throws {
        try self.init(specDocumentNode: try SwaggerDocumentNode<SwaggerSpec>(filePath: filePath))
    }

    // MARK: - Instance Methods

    private func resolveReferences(of document: SwaggerDocument) throws {
        allDocuments.append(document)

        try document.components.forEach { componentURI, component in
            guard let componentAbsoluteURI = document.componentAbsoluteURI(componentURI) else {
                throw SwaggerError.invalidComponentURI(componentURI, documentURL: document.url)
            }

            allComponents[componentAbsoluteURI] = component
        }

        try document.resolveReferences(with: self)
    }

    private func resolveReference<T: Codable>(
        componentURI: String,
        document: SwaggerDocument
    ) throws -> SwaggerComponent<T> {
        guard (document.url != nil) || componentURI.contains("://") || componentURI.starts(with: "#/") else {
            throw SwaggerError.invalidReferenceURI(componentURI, documentURL: document.url)
        }

        guard let componentAbsoluteURI = document.componentAbsoluteURI(componentURI) else {
            throw SwaggerError.invalidReferenceURI(componentURI, documentURL: document.url)
        }

        if let component = allComponents[componentAbsoluteURI] {
            guard let component = component as? SwaggerComponent<T> else {
                throw SwaggerError.invalidReferenceURI(componentURI, documentURL: document.url)
            }

            return component
        } else {
            var componentURIComponents = componentAbsoluteURI.components(separatedBy: "#/")

            let componentCodingPath: [String]
            let componentDocumentURI: String

            if componentURIComponents.count > 1 {
                componentCodingPath = componentURIComponents.removeLast().components(separatedBy: "/")
                componentDocumentURI = componentURIComponents.joined()
            } else {
                componentCodingPath = []
                componentDocumentURI = componentAbsoluteURI
            }

            guard let componentDocumentURL = URL(string: componentDocumentURI) else {
                throw SwaggerError.invalidReferenceURI(componentURI, documentURL: document.url)
            }

            let documentNode = try SwaggerDocumentNode<SwaggerComponent<T>>(
                url: componentDocumentURL,
                codingPath: componentCodingPath
            )

            try resolveReferences(of: documentNode.document)

            return documentNode.value
        }
    }

    private func resolveReference<T: Codable>(
        componentName: String,
        document: SwaggerDocument
    ) throws -> SwaggerComponent<T> {
        let componentElement = document.components.lazy
            .compactMap { (key: $0.key, value: $0.value as? SwaggerComponent<T>) }
            .first { $0.key.components(separatedBy: "/").last == componentName }

        guard let component = componentElement?.value else {
            return try resolveReference(componentURI: componentName, document: document)
        }

        return component
    }
}

extension Swagger: SwaggerDocumentContext {

    // MARK: - Instance Methods

    internal func component<T: Codable>(
        at componentURI: String,
        document: SwaggerDocument
    ) throws -> SwaggerComponent<T> {
        if componentURI == componentURI.components(separatedBy: "/").last {
            return try resolveReference(componentName: componentURI, document: document)
        } else {
            return try resolveReference(componentURI: componentURI, document: document)
        }
    }
}
