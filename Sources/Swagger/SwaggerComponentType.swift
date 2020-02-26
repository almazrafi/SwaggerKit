import Foundation

/// An enumeration of component types.
public indirect enum SwaggerComponentType<T: Codable> {

    // MARK: - Enumeration Cases

    /// Reference
    case reference(SwaggerReference<T>)

    /// Value
    case value(T)
}

extension SwaggerComponentType: Equatable where T: Equatable { }
