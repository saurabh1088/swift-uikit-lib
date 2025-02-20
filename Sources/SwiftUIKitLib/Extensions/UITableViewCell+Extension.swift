//
//  File.swift
//  SwiftUIKitLib
//
//  Created by Saurabh Verma on 20/02/25.
//

import UIKit

public extension UITableViewCell {
    static var identifier: String {
        String(describing: self)
    }
}

public extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("The dequeued cell is not an instance of \(T.self).")
        }
        return cell
    }
}
