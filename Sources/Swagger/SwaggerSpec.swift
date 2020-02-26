import Foundation

public struct SwaggerSpec: Codable, Equatable {

    // MARK: - Nested Types

    private enum CodingKeys: String, CodingKey {
        case version = "openapi"
        case info
        case externalDocumentation = "externalDocs"

        case tags
        case components
        case servers
        case security
        case paths
    }

    // MARK: - Type Properties

    public static let supportedVersionRange = SwaggerVersion(major: 3)..<SwaggerVersion(major: 4)

    // MARK: - Instance Properties

    private var extensionsContainer: SwaggerExtensionsContainer

    public var version: SwaggerVersion
    public var info: SwaggerInfo
    public var externalDocumentation: SwaggerExternalDocumentation?

    public var tags: [SwaggerTag]?
    public var components: SwaggerComponents?
    public var servers: [SwaggerServer]?
    public var security: [String: [String]]?
    public var paths: [String: SwaggerComponent<SwaggerPath>]

    /// The extensions properties.
    /// Keys will be prefixed by "x-" when encoding.
    /// Values can be a primitive, an array or an object. Can have any valid JSON format value.
    public var extensions: [String: Any] {
        get { extensionsContainer.content }
        set { extensionsContainer.content = newValue }
    }

    // MARK: - Initializers

    public init(
        version: SwaggerVersion,
        info: SwaggerInfo,
        externalDocumentation: SwaggerExternalDocumentation? = nil,
        tags: [SwaggerTag]? = nil,
        components: SwaggerComponents? = nil,
        servers: [SwaggerServer]? = nil,
        security: [String: [String]]? = nil,
        paths: [String: SwaggerComponent<SwaggerPath>],
        extensions: [String: Any] = [:]
    ) {
        self.extensionsContainer = SwaggerExtensionsContainer(content: extensions)

        self.version = version
        self.info = info
        self.externalDocumentation = externalDocumentation

        self.tags = tags
        self.components = components
        self.servers = servers
        self.security = security
        self.paths = paths
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        version = try container.decode(SwaggerVersion.self, forKey: .version)

        guard SwaggerSpec.supportedVersionRange.contains(version) else {
            throw DecodingError.dataCorruptedError(
                forKey: .version,
                in: container,
                debugDescription: "Specification version is not supported: \(version)"
            )
        }

        info = try container.decode(forKey: .info)
        externalDocumentation = try container.decodeIfPresent(forKey: .externalDocumentation)

        tags = try container.decodeIfPresent(forKey: .tags)
        components = try container.decodeIfPresent(forKey: .components)
        servers = try container.decodeIfPresent(forKey: .servers)

        security = try container
            .decodeIfPresent([[String: [String]]].self, forKey: .security)
            .map { security in
                Dictionary(security.compactMap { $0.first }) { $1 }
            }

        paths = try container.decode(forKey: .paths)

        extensionsContainer = try SwaggerExtensionsContainer(from: decoder)
    }

    // MARK: - Instance Methods

    public func encode(to encoder: Encoder) throws {
        guard SwaggerSpec.supportedVersionRange.contains(version) else {
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
        try container.encodeIfPresent(components, forKey: .components)
        try container.encodeIfPresent(servers, forKey: .servers)

        try container.encodeIfPresent(
            security?.map { [$0.key: $0.value] },
            forKey: .security
        )

        try container.encode(paths, forKey: .paths)

        try extensionsContainer.encode(to: encoder)
    }
}
