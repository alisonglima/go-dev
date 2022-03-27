import Foundation

struct User {
    let name: String
    let username: String
    let email: String
    let password: String
    
    init(_ name: String, _ username: String, _ email: String, _ password: String) {
        self.name = name
        self.username = username
        self.email = email
        self.password = password
    }
}
