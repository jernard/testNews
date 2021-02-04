//
//  LoginPresenterTest.swift
//  testNewsTests
//
//  Created by Jernard Ducon on 4/02/21.
//

import XCTest
@testable import testNews

class LoginTest: XCTestCase {
    
    var viewController: LoginViewController!
    var interactor: LoginInteractor!
    var presenter: LoginPresenter!
    var mockCoordinator: mockLoginCoordinator!
    
    override func setUp() {
        super.setUp()
        
        let networkManager = NetworkManagerMock()
        mockCoordinator = mockLoginCoordinator()
        viewController = LoginViewController.instantiateFromNews()
        interactor = LoginInteractor(networkManager: networkManager)
        presenter = LoginPresenter(view: viewController, interactor: interactor, coordinator: mockCoordinator)
        interactor.setup(presenter: presenter)
        viewController.setup(presenter: presenter)
    }
    
    override func tearDown() {
        viewController = nil
        interactor = nil
        presenter = nil
        super.tearDown()
    }
    
    func test_loginSuccess() {
        // Given:
        
        // When:
        presenter.requestLogin(user: "devmobile", password: "uC&+}H4wg?rYbF:")
        // Then:
        XCTAssertTrue(mockCoordinator.coordinateToNewsWasCalled)
    }

}
