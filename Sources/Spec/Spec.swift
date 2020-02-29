import Foundation

public struct Spec: Codable, Equatable, Changeable {

    // MARK: - Nested Types

    private enum CodingKeys: String, CodingKey {
        case version = "openapi"
        case info
        case externalDocumentation = "externalDocs"

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
    public var externalDocumentation: SpecExternalDocumentation?

    public var tags: [SpecTag]?
    public var servers: [SpecServer]?
    public var security: [String: [String]]?
    public var paths: [String: SpecComponent<SpecPath>]
    public var components: SpecComponents?

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
        externalDocumentation: SpecExternalDocumentation? = nil,
        tags: [SpecTag]? = nil,
        servers: [SpecServer]? = nil,
        security: [String: [String]]? = nil,
        paths: [String: SpecComponent<SpecPath>],
        components: SpecComponents? = nil,
        extensions: [String: Any] = [:]
    ) {
        self.extensionsContainer = SpecExtensionsContainer(content: extensions)

        self.version = version
        self.info = info
        self.externalDocumentation = externalDocumentation

        self.tags = tags
        self.servers = servers
        self.security = security
        self.paths = paths
        self.components = components
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
        externalDocumentation = try container.decodeIfPresent(forKey: .externalDocumentation)

        tags = try container.decodeIfPresent(forKey: .tags)
        servers = try container.decodeIfPresent(forKey: .servers)

        security = try container
            .decodeIfPresent([[String: [String]]].self, forKey: .security)
            .map { security in
                Dictionary(security.compactMap { $0.first }) { $1 }
            }

        paths = try container.decode(forKey: .paths)
        components = try container.decodeIfPresent(forKey: .components)

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
        try container.encodeIfPresent(externalDocumentation, forKey: .externalDocumentation)

        try container.encodeIfPresent(tags, forKey: .tags)
        try container.encodeIfPresent(servers, forKey: .servers)

        try container.encodeIfPresent(
            security?.map { [$0.key: $0.value] },
            forKey: .security
        )

        try container.encode(paths, forKey: .paths)
        try container.encodeIfPresent(components, forKey: .components)

        try extensionsContainer.encode(to: encoder)
    }
}
