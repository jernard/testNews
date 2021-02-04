//
//  UITableView+Extensions.swift
//  testNews
//
//  Created by Jernard Ducon on 4/02/21.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        let identifier = String(describing: T.self)
        guard let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T else {
            fatalError("Could not load cell with id: \(identifier)")
        }
        return cell
    }
    
    func dequeueReusableHeaderFooter<T: UITableViewHeaderFooterView>() -> T {
        let identifier = String(describing: T.self)
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: identifier) as? T else {
            fatalError("Could not load header/footer with id: \(identifier)")
        }
        return view
    }
    
    func register(_ cellClass: AnyClass) {
        let name = String(describing: cellClass)
        let nib = UINib(nibName: name, bundle: nil)
        register(nib, forCellReuseIdentifier: name)
    }
    
    func registerHeaderFooter(_ headerFooterClass: AnyClass) {
        let identifier = String(describing: headerFooterClass)
        register(headerFooterClass, forHeaderFooterViewReuseIdentifier: identifier)
    }
}
