import Foundation

extension JSONDecoder {

    // MARK: - Instance Methods

    internal func decode<T: Decodable>(
        _ type: T.Type = T.self,
        from data: Data,
        codingPath: [String]
    ) throws -> T {
        let initialUserInfo = userInfo

        defer {
            userInfo = initialUserInfo
        }

        userInfo[.codingPath] = codingPath

        return try decode(CodingPathWrapper<T>.self, from: data).value
    }
}
