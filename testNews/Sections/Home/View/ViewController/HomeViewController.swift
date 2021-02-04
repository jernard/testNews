//
//  HomeViewController.swift
//  testNews
//
//  Created by Jernard Ducon on 4/02/21.
//

import UIKit

class HomeViewController: UIViewController, HomeViewControllerProtocol {
    var presenter: HomePresenterProtocol?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCells()
        presenter?.fetchNews()
    }
    
    func setup(presenter: HomePresenterProtocol) {
        self.presenter = presenter
    }
    
    //MARK: - Functions
    private func registerCells() {
        tableView.register(HomeTableViewCell.self)
    }
    
    func setupTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
    }
    
    // MARK: - Helpers
    func reloadData() {
        guard let tableView = tableView else { return }
        tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let presenter = presenter else { return UITableViewCell()}
        return presenter.cellForRowAt(tableView, cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let presenter = presenter else { return }
        presenter.presentDetailNews(indexPath: indexPath)
    }
}
