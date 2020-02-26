import Foundation
import SwaggerKit

enum SwaggerSchemaXMLSeeds {

    // MARK: - Type Properties

    static let attributeYAML = "attribute: true"
    static let attribute = SwaggerSchemaXML(isAttribute: true)

    static let namespaceYAML = """
        prefix: sample
        namespace: http://example.com/schema/sample
        """

    static let namespace = SwaggerSchemaXML(
        namePrefix: "sample",
        namespaceURI: "http://example.com/schema/sample"
    )

    static let wrappedArrayYAML = """
        name: items
        wrapped: true
        x-private: true
        """

    static let wrappedArray = SwaggerSchemaXML(
        name: "items",
        isWrapped: true,
        extensions: ["private": true]
    )
}
