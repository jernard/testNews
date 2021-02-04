//
//  CoordinatorProtocol.swift
//  testNews
//
//  Created by Jernard Ducon on 4/02/21.
//

import UIKit

protocol Coordinator {
    func start()
    func coordinate(to coordinator: Coordinator)
}

extension Coordinator {
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}
