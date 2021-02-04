//
//  HomeCoordinator.swift
//  testNews
//
//  Created by Jernard Ducon on 4/02/21.
//

import Foundation
import UIKit

protocol HomeFlow: class {
    func coordinateToDetailNew(model: NewModel)
    func coordinateToLogin()
}

class HomeCoordinator: Coordinator, HomeFlow {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let networkManager = NetworkManager()
        
        let viewController = HomeViewController.instantiateFromNews()
        let interactor = HomeInteractor(networkManager: networkManager)
        let presenter = HomePresenter(view: viewController, interactor: interactor, coordinator: self)
        interactor.setup(presenter: presenter)
        viewController.setup(presenter: presenter)
        
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    
    // MARK: - Flow Methods
    
    func coordinateToDetailNew(model: NewModel) {
        let detailCoordinator = HomeDetailCoordinator(navigationController: navigationController, model: model)
        navigationController.isNavigationBarHidden = false
        coordinate(to: detailCoordinator)
    }
    
    func coordinateToLogin() {
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        navigationController.viewControllers = []
        navigationController.isNavigationBarHidden = true
        coordinate(to: loginCoordinator)
    }
}
