//
//  HomeDetailPresenter.swift
//  testNews
//
//  Created by Jernard Ducon on 4/02/21.
//

import Foundation

class HomeDetailPresenter: HomeDetailPresenterProtocol {

    weak var view: HomeDetailViewControllerProtocol?
    var interactor: HomeDetailInteractorProtocol?
    var coordinator: HomeDetailCoordinator
    private var newObject: NewModel?
    
    required init(view: HomeDetailViewControllerProtocol, interactor: HomeDetailInteractorProtocol, coordinator: HomeDetailCoordinator) {
        self.view = view
        self.interactor = interactor
        self.coordinator = coordinator
    }
    
    func setup(newObject: NewModel){
        self.newObject = newObject
    }
    
    func fetchDetailNews() {
        guard let new = newObject else { return }
        interactor?.fetchNews(id: new.id_documento)
    }
    
    func didDetailNew(model: FullNewModel) {
        view?.didFetchDetailNew(model: model)
    }
    
    func failedfetchDetailNews() {
        
    }
    
}
