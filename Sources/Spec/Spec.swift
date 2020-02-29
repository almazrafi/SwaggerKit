import Foundation

public struct Spec: Codable, Equatable, Changeable {

    // MARK: - Nested Types

    private enum CodingKeys: String, CodingKey {
        case version = "openapi"
        case info
        case externalDocs

        case tags
        case servers
        case security
        case paths
        case components
    }

    // MARK: - Type Properties

    public static let supportedVersionRange = SpecVersion(major: 3)..<SpecVersion(major: 4)

    // MARK: - Instance Properties

    private var extensionsContainer: SpecExtensionsContainer

    public var version: SpecVersion
    public var info: SpecInfo
    public var externalDocs: SpecExternalDocs?

    public var tags: [SpecTag]?
    public var servers: [SpecServer]?
    public var security: [SpecSecurityRequirement]?
    public var components: SpecComponents?
    public var paths: [String: SpecComponent<SpecPath>]

    /// The extensions properties.
    /// Keys will be prefixed by "x-" when encoding.
    /// Values can be a primitive, an array or an object. Can have any valid JSON format value.
    public var extensions: [String: Any] {
        get { extensionsContainer.content }
        set { extensionsContainer.content = newValue }
    }

    // MARK: - Initializers

    public init(
        version: SpecVersion,
        info: SpecInfo,
        externalDocs: SpecExternalDocs? = nil,
        tags: [SpecTag]? = nil,
        servers: [SpecServer]? = nil,
        security: [SpecSecurityRequirement]? = nil,
        components: SpecComponents? = nil,
        paths: [String: SpecComponent<SpecPath>],
        extensions: [String: Any] = [:]
    ) {
        self.extensionsContainer = SpecExtensionsContainer(content: extensions)

        self.version = version
        self.info = info
        self.externalDocs = externalDocs

        self.tags = tags
        self.servers = servers
        self.security = security
        self.components = components
        self.paths = paths
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        version = try container.decode(forKey: .version)

        guard Spec.supportedVersionRange.contains(version) else {
            throw DecodingError.dataCorruptedError(
                forKey: .version,
                in: container,
                debugDescription: "Specification version is not supported: \(version)"
            )
        }

        info = try container.decode(forKey: .info)
        externalDocs = try container.decodeIfPresent(forKey: .externalDocs)

        tags = try container.decodeIfPresent(forKey: .tags)
        servers = try container.decodeIfPresent(forKey: .servers)
        security = try container.decodeIfPresent(forKey: .security)
        components = try container.decodeIfPresent(forKey: .components)
        paths = try container.decode(forKey: .paths)

        extensionsContainer = try SpecExtensionsContainer(from: decoder)
    }

    // MARK: - Instance Methods

    public func encode(to encoder: Encoder) throws {
        guard Spec.supportedVersionRange.contains(version) else {
            let errorContext = EncodingError.Context(
                codingPath: encoder.codingPath.appending(CodingKeys.version),
                debugDescription: "Specification version is not supported"
            )

            throw EncodingError.invalidValue(version, errorContext)
        }

        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(version, forKey: .version)
        try container.encode(info, forKey: .info)
        try container.encodeIfPresent(externalDocs, forKey: .externalDocs)

        try container.encodeIfPresent(tags, forKey: .tags)
        try container.encodeIfPresent(servers, forKey: .servers)
        try container.encodeIfPresent(security, forKey: .security)
        try container.encodeIfPresent(components, forKey: .components)
        try container.encode(paths, forKey: .paths)

        try extensionsContainer.encode(to: encoder)
    }
}
