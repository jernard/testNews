//
//  LoginProtocols.swift
//  testNews
//
//  Created by Jernard Ducon on 4/02/21.
//

import Foundation

protocol LoginViewControllerProtocol: class {
    var presenter: LoginPresenterProtocol? { get set }
    
    
}

protocol LoginPresenterProtocol: class {
    var view: LoginViewControllerProtocol? { get set }
    var interactor: LoginInteractorProtocol? { get set }
    var coordinator: LoginFlow { get set }
    
    init(view: LoginViewControllerProtocol, interactor: LoginInteractorProtocol, coordinator: LoginFlow)
    
    func requestLogin(user: String, password: String)
    
    func toNews()
    func failedLogin()
    func badAccess()
}

protocol LoginInteractorProtocol: class {
    var presenter: LoginPresenterProtocol? { get set }
    var networkManager: NetworkManagerProtocol { get set }
    
    init(networkManager: NetworkManagerProtocol) 
    
    func requestLogin(login: LoginBody)
}
