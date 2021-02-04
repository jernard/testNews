//
//  HomeDetailDetailProtocol.swift
//  testNews
//
//  Created by Jernard Ducon on 4/02/21.
//

import Foundation

protocol HomeDetailViewControllerProtocol: class {
    var presenter: HomeDetailPresenterProtocol? { get set }
    
    func didFetchDetailNew(model: FullNewModel)
}

protocol HomeDetailPresenterProtocol: class {
    var view: HomeDetailViewControllerProtocol? { get set }
    var interactor: HomeDetailInteractorProtocol? { get set }
    var coordinator: HomeDetailCoordinator { get set }
    
    init(view: HomeDetailViewControllerProtocol, interactor: HomeDetailInteractorProtocol, coordinator: HomeDetailCoordinator)
    
    func fetchDetailNews()
    
    func didDetailNew(model: FullNewModel)
    func failedfetchDetailNews()
}

protocol HomeDetailInteractorProtocol: class {
    var presenter: HomeDetailPresenterProtocol? { get set }
    var networkManager: NetworkManager { get set }
    
    init(networkManager: NetworkManager)
    
    func fetchNews(id: String)
}

