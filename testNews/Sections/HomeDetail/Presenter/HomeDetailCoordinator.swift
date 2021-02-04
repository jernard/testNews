//
//  HomeDetailCoordinator.swift
//  testNews
//
//  Created by Jernard Ducon on 4/02/21.
//

import Foundation
import UIKit

protocol HomeDetailFlow: class {
    
}

class HomeDetailCoordinator: Coordinator, HomeDetailFlow {
    let navigationController: UINavigationController
    let model: NewModel
    
    init(navigationController: UINavigationController, model: NewModel) {
        self.navigationController = navigationController
        self.model = model
    }
    
    func start() {
        let networkManager = NetworkManager()
        
        let viewController = HomeDetailViewController.instantiateFromNews()
        let interactor = HomeDetailInteracor(networkManager: networkManager)
        let presenter = HomeDetailPresenter(view: viewController, interactor: interactor, coordinator: self)
        interactor.setup(presenter: presenter)
        presenter.setup(newObject: self.model)
        viewController.setup(presenter: presenter)
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    // MARK: - Flow Methods
    
    
}
