//
//  HomeTest.swift
//  testNewsTests
//
//  Created by Jernard Ducon on 4/02/21.
//

import XCTest
@testable import testNews

class HomeTest: XCTestCase {
    
    var viewController: HomeViewController!
    var interactor: HomeInteractor!
    var presenter: HomePresenter!
    var mockCoordinator: mockHomeCoordinator!
    
    override func setUp() {
        super.setUp()
        
        let NetworkManager = NetworkManagerMock()
        mockCoordinator = mockHomeCoordinator()
        
        viewController = HomeViewController.instantiateFromNews()
        interactor = HomeInteractor(networkManager: NetworkManager)
        presenter = HomePresenter(view: viewController, interactor: interactor, coordinator: mockCoordinator)
        interactor.setup(presenter: presenter)
        viewController.setup(presenter: presenter)
    }
    
    override func tearDown() {
        viewController = nil
        interactor = nil
        presenter = nil
        mockCoordinator = nil
        super.tearDown()
    }
    
    func test_fetchNews() {
        // Given:
        
        // When:
        presenter.fetchNews()
        // Then:
        XCTAssertEqual(presenter.state.elements.count, 2)
        XCTAssertEqual(presenter.state.elements.first?.chapeu, "chapeu1")
        XCTAssertEqual(presenter.state.elements[1].chapeu, "chapeu2")
    }
    
    func test_fetchNewsFailed() {
        // Given:
        let networkManagerMockError = NetworkManagerMockError()
        interactor.networkManager = networkManagerMockError
        // When:
        presenter.fetchNews()
        // Then:
        XCTAssertTrue(mockCoordinator.coordinateToLoginWasCalled, "Token")
    }
    
    func test_parseData() {
        // Given
        let decoder = JSONDecoder()
        let jsonString = MockConstants.news
        let jsonData = Data(jsonString.utf8)
        // When
        do {
            let detail = try decoder.decode([NewModel].self, from: jsonData)
            XCTAssertEqual(detail.first?.id_documento, "1")
        } catch {
            XCTFail()
        }
    }
}
