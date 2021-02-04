//
//  HomeMocks.swift
//  testNewsTests
//
//  Created by Jernard Ducon on 4/02/21.
//

import Foundation
@testable import testNews


class mockHomeCoordinator: HomeFlow {
        
    var coordinateToDetailNewWasCalled = false
    var coordinateToLoginWasCalled = false
    
    func coordinateToDetailNew(model: NewModel) {
        coordinateToDetailNewWasCalled = true
    }
    
    func coordinateToLogin() {
        coordinateToLoginWasCalled = true
    }
}
