import Foundation

// MARK: - Profile
struct Profile: Codable {
    let id: Int
    let name: String
    let picture: String
    let status: String
    let friends: [Friend]
}
