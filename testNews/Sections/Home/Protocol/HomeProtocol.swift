//
//  HomeProtocol.swift
//  testNews
//
//  Created by Jernard Ducon on 4/02/21.
//

import Foundation
import UIKit

protocol HomeViewControllerProtocol: class {
    var presenter: HomePresenterProtocol? { get set }
    
    func reloadData()
}

protocol HomePresenterProtocol: class {
    var view: HomeViewControllerProtocol? { get set }
    var interactor: HomeInteractorProtocol? { get set }
    var coordinator: HomeFlow { get set }
    
    init(view: HomeViewControllerProtocol, interactor: HomeInteractorProtocol, coordinator: HomeFlow)
    
    func fetchNews()
    func didNews(news: [NewModel])
    func failedFetchNews()
    
    func presentDetailNews(indexPath: IndexPath)
    
    func numberOfRows() -> Int
    func cellForRowAt(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
}

protocol HomeInteractorProtocol: class {
    var presenter: HomePresenterProtocol? { get set }
    var networkManager: NetworkManagerProtocol { get set }
    
    init(networkManager: NetworkManagerProtocol)
    
    func fetchNews()
}

