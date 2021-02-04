//
//  SplashPresenter.swift
//  testNews
//
//  Created by Jernard Ducon on 3/02/21.
//

import Foundation

class SplashPresenter: SplashPresenterProtocol {
    
    weak var view: SplashViewControllerProtocol?
    var interactor: SplashInteractorProtocol?
    var coordinator: SplashCoordinator?
    
    
    required init(view: SplashViewControllerProtocol, interactor: SplashInteractorProtocol) {
        self.view = view
        self.interactor = interactor
        
    }
    
    func loadSession() {
        interactor?.loadSession()
    }
    
    func toLoginView() {
        coordinator?.coordinateToLogin()
    }
    
    func toHome() {
        coordinator?.coordinateToNews()
    }
}
