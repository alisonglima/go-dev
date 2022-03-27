import Foundation
import Alamofire

enum APIError: Error {
    case urlInvalid
    case noProcessData
    case noDataAvailable
    case requestError
}

protocol ServiceProtocol {
    func getProfile(completion: @escaping(Result<FriendList, APIError>) -> Void)
}

class Service: ServiceProtocol {
    let url = "https://run.mocky.io/v3/fa446ac2-0e17-4d41-a1eb-52e2cb979876"
    
    static var shared: Service {
        let instance = Service()
        return instance
    }
    
    func getProfile(completion: @escaping (Result<FriendList, APIError>) -> Void) {
        guard let url = URL(string: url) else { return completion(.failure(.urlInvalid))}
        
        AF.request(url, method: .get).validate().responseDecodable(of: FriendList.self) { response in
            guard let profile = response.value else { return completion(.failure(.requestError)) }
            
            completion(.success(profile))
        }
        
    }
}
