import Foundation
import Yams

extension YAMLDecoder {

    // MARK: - Instance Methods

    internal func decode<T: Decodable>(
        _ type: T.Type = T.self,
        from string: String,
        userInfo: [CodingUserInfoKey: Any] = [:],
        codingPath: [String]
    ) throws -> T {
        let userInfo = userInfo.merging([.codingPath: codingPath]) { $1 }

        return try decode(CodingPathWrapper<T>.self, from: string, userInfo: userInfo).value
    }
}
