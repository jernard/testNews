//
//  HomeInteractor.swift
//  testNews
//
//  Created by Jernard Ducon on 4/02/21.
//

import Foundation

class HomeInteractor: HomeInteractorProtocol {
    weak var presenter: HomePresenterProtocol?
    var networkManager: NetworkManagerProtocol
    
    required init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func setup(presenter: HomePresenterProtocol) {
        self.presenter = presenter
    }
    
    func fetchNews() {
        networkManager.fetchNews { [weak self] (result) in
            switch result {
            case .success(let news):
                self?.presenter?.didNews(news: news)
            case .failure(let _):
                self?.presenter?.failedFetchNews()
            }
        }
    }
}
