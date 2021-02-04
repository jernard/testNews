//
//  NerworkManager.swift
//  testNews
//
//  Created by Jernard Ducon on 3/02/21.
//

import Foundation

typealias loginHandler = (Result<Token, Error>) -> Void
typealias fetchNewsHandler = (Result<[NewModel], Error>) -> Void
typealias fetchNewHandler = (Result<[FullNewModel], Error>) -> Void

protocol NerworkManagerProtocol {
    func requestLogin(with user: LoginBody, _ completion: @escaping loginHandler)
    func fetchNews(_ completion: @escaping fetchNewsHandler)
    func fetchNew(with id: String, _ completion: @escaping fetchNewHandler)
}

class NetworkManager: NerworkManagerProtocol{
    func requestLogin(with user: LoginBody, _ completion: @escaping loginHandler) {
        request(target: .login(user), completion: completion)
    }
    
    func fetchNews(_ completion: @escaping fetchNewsHandler) {
        request(target: .news, completion: completion)
    }
    
    func fetchNew(with id: String, _ completion: @escaping fetchNewHandler) {
        request(target: .newById(id), completion: completion)
    } 
}

private extension NetworkManager {
    private func request<T: Decodable>(target: BaseAPI, completion: @escaping (Result<T, Error>) -> ()) {
        baseAPIProvider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
