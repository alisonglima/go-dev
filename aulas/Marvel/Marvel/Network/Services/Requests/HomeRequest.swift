import Foundation

enum HomeRequest: URLRequestProtocol {
    case home
    
    var baseURL: String {
        return Environment.baseURL
    }
    
    var path: String {
        
        /*
         timestamp
         
         MD5 = timestamp + privateKey + publicKey
         */
        
        let timestamp = NSDate().timeIntervalSince1970.description
        
        switch self {
        case .home:
            return "limit=30&ts=\(timestamp)&apikey=\(Environment.publicKey)&hash=\(hashMD5(timestamp: timestamp))"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
}
