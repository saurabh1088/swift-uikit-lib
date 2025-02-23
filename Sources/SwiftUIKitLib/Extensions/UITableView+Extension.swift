//
//  File.swift
//  SwiftUIKitLib
//
//  Created by Saurabh Verma on 20/02/25.
//

import UIKit

public extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(_: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("The dequeued cell is not an instance of \(T.self).")
        }
        return cell
    }
    
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView {
        if let nib = T.nib {
            register(nib, forCellReuseIdentifier: T.reuseIdentifier)
        } else {
            register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
        }
    }
}
