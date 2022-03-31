import Foundation

 /// Defines the suported types of HTTP methods
enum HTTPMethod: String {
    case post
    case put
    case get
    case delete
    case patch
    
    public var name: String {
        return rawValue.uppercased()
    }
}

