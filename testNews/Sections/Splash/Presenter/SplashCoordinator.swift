//
//  SplashCoordinator.swift
//  testNews
//
//  Created by Jernard Ducon on 4/02/21.
//

import Foundation
import UIKit

protocol SplashFlow: class {
    func coordinateToLogin()
    func coordinateToNews()
}

class SplashCoordinator: Coordinator, SplashFlow {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = SplashViewController.instantiateFromNews()
        
        let interactor = SplashInteractor()
        let presenter = SplashPresenter(view: viewController, interactor: interactor)
        presenter.coordinator = self
        viewController.setup(presenter: presenter)
        interactor.setup(presenter: presenter)
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    // MARK: - Flow Methods
    func coordinateToLogin() {
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        navigationController.viewControllers = []
        navigationController.isNavigationBarHidden = true
        coordinate(to: loginCoordinator)
    }
    
    func coordinateToNews() {
        let homeCoordinator = HomeCoordinator(navigationController: navigationController)
        navigationController.viewControllers = []
        navigationController.isNavigationBarHidden = true
        coordinate(to: homeCoordinator)
    }
}
