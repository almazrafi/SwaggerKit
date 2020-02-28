import Foundation

/// An enumeration of serialization types of the header.
/// Get more info: https://swagger.io/specification/#headerObject
public enum SpecHeaderSerialization: Equatable {

    // MARK: - Enumeration Cases

    /// Serialization with `schema` property that describes the structure and syntax of the header.
    /// Used for simple scenarios.
    case schema(SpecHeaderSchema)

    /// Serialization with `content` property that contains the representations for the header.
    /// The key is the media type and the value describes it. The map must only contain one entry.
    /// Used for more complex scenarios.
    case content([String: SpecMediaType])
}
