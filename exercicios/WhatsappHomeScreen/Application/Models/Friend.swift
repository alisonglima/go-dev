import Foundation

// MARK: - Friend
struct Friend: Codable {
    let id: Int
    let name: String
    let picture: String
    let latestTimestamp, lastChat: String

    enum CodingKeys: String, CodingKey {
        case id, name, picture
        case latestTimestamp = "latest_timestamp"
        case lastChat
    }
}

typealias FriendList = [Friend]
