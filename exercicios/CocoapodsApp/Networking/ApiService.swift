//
//  ApiService.swift
//  CocoapodsApp
//
//  Created by FL00022 on 21/03/22.
//

import Foundation

enum CustomError: Error {
    case urlInvalid
    case noProcessData
    case noDataAvaliable
}

protocol ServiceProtocol {
    func getPeople(completion: @escaping (Result<PeopleList, CustomError>) -> Void)
}

class ApiService: ServiceProtocol {
    let baseUrl = "https://run.mocky.io/v3/f0c36709-84e2-4043-a0f0-3bec512f6c84"
    let session = URLSession.shared
    
    static var shared: ApiService {
        let instance = ApiService()
        return instance
    }
    
    func getPeople(completion: @escaping (Result<PeopleList, CustomError>) -> Void) {
        guard let url = URL(string: baseUrl)
        else {
            return completion(.failure(.urlInvalid))
        }
        
        let dataTask = session.dataTask(with: url) { data, _ , _ in
            do {
                guard let jsonData = data else { return completion(.failure(.noDataAvaliable)) }
                
                let decoder = JSONDecoder()
                let peopleList = try decoder.decode(PeopleList.self, from: jsonData)
                
                completion(.success(peopleList))
                
            } catch {
                completion(.failure(.noProcessData))
            }
        }
        
        dataTask.resume()
    }
}
