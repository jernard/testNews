//
//  File.swift
//  testNewsTests
//
//  Created by Jernard Ducon on 4/02/21.
//

import Foundation
import UIKit
@testable import testNews

class LoginPresenterMock: LoginPresenterProtocol {
    var view: LoginViewControllerProtocol?
    var interactor: LoginInteractorProtocol?
    var coordinator: LoginFlow
    
    var requestLoginWasCalled = false
    var toNewsWasCalled = false
    var failedLoginWasCalled = false
    var badAccessWasCalled = false
    
    init() {
        self.view = nil
        self.interactor = nil
        self.coordinator = LoginCoordinator(navigationController: UINavigationController())
    }
    
    required init(view: LoginViewControllerProtocol, interactor: LoginInteractorProtocol, coordinator: LoginFlow) {
        self.view = view
        self.interactor = interactor
        self.coordinator = coordinator
    }
    
    func requestLogin(user: String, password: String) {
        requestLoginWasCalled = true
        let body = LoginBody(user: user, pass: password)
        interactor?.requestLogin(login: body)
    }
    
    func toNews() {
        toNewsWasCalled = true
    }
    
    func failedLogin() {
        failedLoginWasCalled = true
    }
    
    func badAccess() {
        badAccessWasCalled = true
    }
    
    
}

class mockLoginCoordinator: LoginFlow {
    var coordinateToNewsWasCalled = false
    
    func start() {
        
    }
    
    func coordinateToNews() {
        coordinateToNewsWasCalled = true
    }
}
