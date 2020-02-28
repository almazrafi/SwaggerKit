import Foundation

/// An enumeration of component types.
public indirect enum SpecComponentType<T: Codable> {

    // MARK: - Enumeration Cases

    /// Reference
    case reference(SpecReference<T>)

    /// Value
    case value(T)
}

extension SpecComponentType: Equatable where T: Equatable { }
