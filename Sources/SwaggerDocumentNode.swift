import Foundation
import Yams

internal struct SwaggerDocumentNode<T: Codable> {

    // MARK: - Instance Properties

    internal let document: SwaggerDocument
    internal let value: T

    // MARK: - Initializers

    internal init(content: String, url: URL? = nil, codingPath: [String] = []) throws {
        let decoder = YAMLDecoder()

        do {
            document = SwaggerDocument(url: url, codingPath: codingPath)

            value = try decoder.decode(
                T.self,
                from: content,
                userInfo: [
                    .swaggerComponentRegistry: document,
                    .swaggerReferenceRegistry: document
                ],
                codingPath: codingPath
            )
        } catch {
            throw SwaggerError.decodingFailed(error, documentURL: url)
        }
    }

    internal init(data: Data, url: URL? = nil, codingPath: [String] = []) throws {
        if let content = String(data: data, encoding: .utf8) {
            try self.init(content: content, url: url, codingPath: codingPath)
        } else if let content = String(data: data, encoding: .utf16) {
            try self.init(content: content, url: url, codingPath: codingPath)
        } else if let content = String(data: data, encoding: .ascii) {
            try self.init(content: content, url: url, codingPath: codingPath)
        } else {
            throw SwaggerError.wrongEncoding(documentURL: url)
        }
    }

    internal init(url: URL, codingPath: [String] = []) throws {
        let data: Data

        do {
            data = try Data(contentsOf: url)
        } catch {
            throw SwaggerError.loadingFailed(error, documentURL: url)
        }

        try self.init(data: data, url: url, codingPath: codingPath)
    }

    internal init(filePath: String, codingPath: [String] = []) throws {
        try self.init(url: URL(fileURLWithPath: filePath), codingPath: codingPath)
    }
}
