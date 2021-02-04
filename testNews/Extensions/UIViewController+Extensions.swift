//
//  UIViewController+Extensions.swift
//  testNews
//
//  Created by Jernard Ducon on 4/02/21.
//

import UIKit
import Foundation

enum StoryboardName: String {
    case main = "Main"
    case news = "News"
}

extension UIViewController {
    
    
    static func instantiate<T: UIViewController>(from name: String) -> T {
        guard let identifier = String(describing: type(of: Self.self)).components(separatedBy: ".").first else {
            fatalError("Could not parse the name of \(String(describing: type(of: Self.self)))")
        }
        let storyboard = UIStoryboard(name: name, bundle: nil)
        
        guard let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("Could not find ViewController with Identifier \(identifier)")
        }
        return viewController
    }
    
    static func instantiateFromNews() -> Self {
        return self.instantiate(from: StoryboardName.news.rawValue)
    }
}
