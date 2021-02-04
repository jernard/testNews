//
//  State.swift
//  testNews
//
//  Created by Jernard Ducon on 4/02/21.
//

import Foundation

enum State<Element, NewsError: Error> {
    case loading
    case populated([Element])
    case error(NewsError)
    
    var elements: [Element] {
        switch self {
        case .populated(let elements):
            return elements
        default:
            return []
        }
    }
}

extension State where Element == NewModel {
    
    var news: [NewModel] {
        return elements
    }
    
    func numberOfRows() -> Int {
        return news.count
    }
    
    func news(for index: Int) -> NewModel {
        return elements[index]
    }
}
