import Foundation

/// An enumeration of known string formats.
/// Get more info: https://swagger.io/specification/#schemaObject
public enum SwaggerStringFormat: String {

    // MARK: - Enumeration Cases

    /// Base64-encoded characters, for example, "U3dhZ2dlciByb2Nrcw==".
    case byte

    /// Binary data.
    case binary

    /// Full-date notation as defined by [RFC 3339, section 5.6](https://tools.ietf.org/html/rfc3339#section-5.6),
    /// for example, "2017-07-21".
    case date

    /// The date-time notation as defined by [RFC 3339, section 5.6](https://tools.ietf.org/html/rfc3339#section-5.6),
    /// for example, "2017-07-21T17:32:28Z".
    case dateTime = "date-time"

    /// Email, for example, "user@example.com".
    case email

    /// Password.
    case password

    /// Hostname, for example, "localhost.localdomain".
    case hostname

    /// IPv4 address, for example, "192.168.0.1".
    case ipv4

    /// IPv6 address, for example, "2001:0db8:11a3:09d7:1f34:8a2e:07a0:765d".
    case ipv6

    /// URI, for example, "http://example.com/object".
    case uri

    /// UUID, for example, "123e4567-e89b-12d3-a456-426655440000".
    case uuid
}
