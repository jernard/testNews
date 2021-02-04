//
//  LoginInteractorTest.swift
//  testNewsTests
//
//  Created by Jernard Ducon on 4/02/21.
//

import XCTest
@testable import testNews

class LoginInteractorTest: XCTestCase {
    
    var sut: LoginInteractor?
    var mockPresenter: LoginPresenterMock!

    override func setUp() {
        super.setUp()
        let networkManager = NetworkManagerMock()
        mockPresenter = LoginPresenterMock()
        sut = LoginInteractor(networkManager: networkManager)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_requestLogin() {
        // Given:
        sut?.setup(presenter: mockPresenter)
        mockPresenter.interactor = sut
        // When:
        mockPresenter.requestLogin(user: "devmobile", password: "uC&+}H4wg?rYbF:")
        // Then:
        
        XCTAssertTrue(mockPresenter.toNewsWasCalled)
    }
    
    func test_requestLoginFailed() {
        // Given:
        let networkManager = NetworkManagerMockError()
        sut?.networkManager = networkManager
        sut?.setup(presenter: mockPresenter)
        mockPresenter.interactor = sut
        // When:
        mockPresenter.requestLogin(user: "devmobile", password: "uC&+}H4wg?rYbF:")
        // Then:
        XCTAssertTrue(mockPresenter.badAccessWasCalled)
    }
}
