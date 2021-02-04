//
//  LoginCoordinator.swift
//  testNews
//
//  Created by Jernard Ducon on 4/02/21.
//

import Foundation
import UIKit

protocol LoginFlow: class {
    func coordinateToNews()
}

class LoginCoordinator: Coordinator, LoginFlow {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let networkManager = NetworkManager()
        
        let viewController = LoginViewController.instantiateFromNews()
        let interactor = LoginInteractor(networkManager: networkManager)
        let presenter = LoginPresenter(view: viewController, interactor: interactor, coordinator: self)
        interactor.setup(presenter: presenter)
        viewController.setup(presenter: presenter)
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    // MARK: - Flow Methods
    
    func coordinateToNews() {
        let homeCoordinator = HomeCoordinator(navigationController: navigationController)
        coordinate(to: homeCoordinator)
    }
}
