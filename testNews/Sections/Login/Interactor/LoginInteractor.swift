//
//  LoginInteractor.swift
//  testNews
//
//  Created by Jernard Ducon on 4/02/21.
//

import Foundation

class LoginInteractor: LoginInteractorProtocol {
    weak var presenter: LoginPresenterProtocol?
    var networkManager: NetworkManagerProtocol
    
    
    required init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func setup(presenter: LoginPresenterProtocol) {
        self.presenter = presenter
    }
    
    func requestLogin(login: LoginBody) {
        
        networkManager.requestLogin(with: login) { [weak self] (result) in
            switch result {
            case .success(let token):
                self?.saveToken(token: token)
            case .failure:
                self?.presenter?.badAccess()
            }
        }
    }
    
    private func saveToken(token: Token) {
        do{
            try StorageData.saveToken(for: token)
            self.presenter?.toNews()
        } catch {
            self.presenter?.failedLogin()
        }
    }
}
