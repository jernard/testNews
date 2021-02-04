//
//  LoginPresenter.swift
//  testNews
//
//  Created by Jernard Ducon on 4/02/21.
//

import Foundation

class LoginPresenter: LoginPresenterProtocol {
    
    weak var view: LoginViewControllerProtocol?
    var interactor: LoginInteractorProtocol?
    var coordinator: LoginFlow
    
    
    required init(view: LoginViewControllerProtocol,
                  interactor: LoginInteractorProtocol,
                  coordinator: LoginFlow) {
        
        self.view = view
        self.interactor = interactor
        self.coordinator = coordinator
    }
    
    func requestLogin(user: String, password: String) {
        let login = LoginBody(user: user, pass: password)
        interactor?.requestLogin(login: login)
    }
    
    func toNews() {
        coordinator.coordinateToNews()
    }
    
    func failedLogin() {
        
    }
    
    func badAccess() {
        
    }
}
