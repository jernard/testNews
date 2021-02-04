//
//  HomePresenter.swift
//  testNews
//
//  Created by Jernard Ducon on 4/02/21.
//

import Foundation
import UIKit

class HomePresenter: HomePresenterProtocol {
       
    weak var view: HomeViewControllerProtocol?
    var interactor: HomeInteractorProtocol?
    var coordinator: HomeFlow
    
    var state: State<NewModel, Error> = .loading {
        didSet { updateTableView() }
    }
    
    required init(view: HomeViewControllerProtocol, interactor: HomeInteractorProtocol, coordinator: HomeFlow) {
        self.view = view
        self.interactor = interactor
        self.coordinator = coordinator
    }
    
    func fetchNews() {
        interactor?.fetchNews()
    }
    
    func didNews(news: [NewModel]) {
        if news.isEmpty {
            //TODO: 
        } else {
            state = .populated(news)
        }
    }
    
    func failedFetchNews() {
        coordinator.coordinateToLogin()
    }
    
    // MARK: - DataSource
    
    func numberOfRows() -> Int {
        return state.numberOfRows()
    }
    
    func cellForRowAt(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        let cardNew = state.news(for: indexPath.row)
        
        cell.setup(new: cardNew)
        return cell
    }
    
    func presentDetailNews(indexPath: IndexPath) {
        let model = state.news(for: indexPath.row)
        coordinator.coordinateToDetailNew(model: model)
    }
    
    // MARK: - Helpers
    func updateTableView() {
        switch state {
        case .populated, .loading:
//            view?.hideLoader()
            view?.reloadData()
        case .error:
            break
        }
    }

}
