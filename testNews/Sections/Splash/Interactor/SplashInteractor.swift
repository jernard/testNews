//
//  SplashInteractor.swift
//  testNews
//
//  Created by Jernard Ducon on 4/02/21.
//

import Foundation

class SplashInteractor: SplashInteractorProtocol {
    weak var presenter: SplashPresenterProtocol?
    
    func setup(presenter: SplashPresenterProtocol) {
        self.presenter = presenter
    }
    
    func loadSession() {
        do {
            let _ = try StorageData.loadToken()
            self.presenter?.toHome()
        } catch  {
            self.presenter?.toLoginView()
        }
    }
    
    
}
