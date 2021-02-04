//
//  SplashProtocols.swift
//  testNews
//
//  Created by Jernard Ducon on 3/02/21.
//

import Foundation


protocol SplashViewControllerProtocol: class {
    var presenter: SplashPresenterProtocol? { get set }
    func startAnimation()
    func stopAnimation()
    
    
}

protocol SplashPresenterProtocol: class {
    var view: SplashViewControllerProtocol? { get set }
    var interactor: SplashInteractorProtocol? { get set }
    var coordinator: SplashCoordinator? { get set }
    
    init(view: SplashViewControllerProtocol, interactor: SplashInteractorProtocol)
    
    func loadSession()
    
    func toLoginView()
    func toHome()
}

protocol SplashInteractorProtocol: class {
    var presenter: SplashPresenterProtocol? { get set }
    func loadSession()
}


