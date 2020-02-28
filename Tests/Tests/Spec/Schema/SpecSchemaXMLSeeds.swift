import Foundation
import SwaggerKit

enum SpecSchemaXMLSeeds {

    // MARK: - Type Properties

    static let attributeYAML = "attribute: true"
    static let attribute = SpecSchemaXML(isAttribute: true)

    static let namespaceYAML = """
        prefix: sample
        namespace: http://example.com/schema/sample
        """

    static let namespace = SpecSchemaXML(
        namePrefix: "sample",
        namespaceURI: "http://example.com/schema/sample"
    )

    static let wrappedArrayYAML = """
        name: items
        wrapped: true
        x-private: true
        """

    static let wrappedArray = SpecSchemaXML(
        name: "items",
        isWrapped: true,
        extensions: ["private": true]
    )
}
