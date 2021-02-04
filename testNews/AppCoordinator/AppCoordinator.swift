//
//  AppCoordinator.swift
//  testNews
//
//  Created by Jernard Ducon on 4/02/21.
//

import UIKit

class AppCoordinator: Coordinator {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        let startCoordinator = SplashCoordinator(navigationController: navigationController)
        coordinate(to: startCoordinator)
    }
}
