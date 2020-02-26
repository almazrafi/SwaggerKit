import Foundation

/// An object representing a version.
/// Get more info: https://swagger.io/specification/#infoObject
public struct SwaggerVersion: Codable, CustomStringConvertible {

    // MARK: - Instance Properties

    /// The major release number, such as 1 in version 1.2.3.
    public var major: Int

    /// The minor release number, such as 2 in version 1.2.3.
    public var minor: Int

    /// The update release number, such as 3 in version 1.2.3.
    public var patch: Int

    // MARK: - CustomStringConvertible

    /// Full string representation of the version number.
    public var description: String {
        "\(major).\(minor).\(patch)"
    }

    // MARK: - Initializers

    /// Creates a new instance with the provided values.
    public init(major: Int, minor: Int = 0, patch: Int = 0) {
        self.major = major
        self.minor = minor
        self.patch = patch
    }

    /// Creates a new instance by decoding from the given decoder.
    ///
    /// This initializer throws an error if reading from the decoder fails, or
    /// if the data read is corrupted or otherwise invalid.
    ///
    /// - Parameter decoder: The decoder to read data from.
    public init(from decoder: Decoder) throws {
        let version = try String(from: decoder)
        let versionComponents = version.components(separatedBy: ".")

        guard let major = versionComponents[safe: 0].flatMap(Int.init) else {
            let errorContext = DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Invalid version: \(version)"
            )

            throw DecodingError.dataCorrupted(errorContext)
        }

        let minor: Int? = try versionComponents[safe: 1].map { component in
            guard let minor = Int(component) else {
                let errorContext = DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Invalid version: \(version)"
                )

                throw DecodingError.dataCorrupted(errorContext)
            }

            return minor
        }

        let patch: Int? = try versionComponents[safe: 2].map { component in
            guard let patch = Int(component) else {
                let errorContext = DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Invalid version: \(version)"
                )

                throw DecodingError.dataCorrupted(errorContext)
            }

            return patch
        }

        self.major = major
        self.minor = minor ?? 0
        self.patch = patch ?? 0
    }

    // MARK: - Instance Methods

    /// Encodes this instance into the given encoder.
    ///
    /// This function throws an error if any values are invalid for the given encoder's format.
    ///
    /// - Parameter encoder: The encoder to write data to.
    public func encode(to encoder: Encoder) throws {
        try description.encode(to: encoder)
    }
}

extension SwaggerVersion: Comparable {

    // MARK: - Type Methods

    /// Returns a Boolean value indicating whether the instance of the first
    /// argument is less than that of the second argument.
    ///
    /// - Parameters:
    ///   - lhs: A instance to compare.
    ///   - rhs: Another instance to compare.
    public static func < (lhs: SwaggerVersion, rhs: SwaggerVersion) -> Bool {
        if lhs.major < rhs.major {
            return true
        }

        if lhs.minor < rhs.minor {
            return true
        }

        if lhs.patch < rhs.patch {
            return true
        }

        return false
    }
}
