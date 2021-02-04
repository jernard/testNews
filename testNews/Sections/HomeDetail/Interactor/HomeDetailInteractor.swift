//
//  HomeDetailInteractor.swift
//  testNews
//
//  Created by Jernard Ducon on 4/02/21.
//

import Foundation

class HomeDetailInteracor: HomeDetailInteractorProtocol {
    weak var presenter: HomeDetailPresenterProtocol?
    var networkManager: NetworkManagerProtocol
    
    required init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func setup(presenter: HomeDetailPresenterProtocol) {
        self.presenter = presenter
    }
    
    func fetchNews(id: String) {
        networkManager.fetchNew(with: id) { [weak self] (result) in
            switch result {
            case .success(let detailNew):
                guard let first = detailNew.first else {
                    self?.presenter?.failedfetchDetailNews()
                    return
                }
                self?.presenter?.didDetailNew(model: first)
            case .failure:
                self?.presenter?.failedfetchDetailNews()
            }
        }
    }
    
}
