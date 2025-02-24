//
//  File.swift
//  SwiftUIKitLib
//
//  Created by Saurabh Verma on 20/02/25.
//

import UIKit

public extension UITableView {
    /// Dequeues a reusable table view cell of the specified type for the given index path.
    /// - Parameters:
    ///   - cellType: The type of cell to dequeue (must inherit from UITableViewCell)
    ///   - indexPath: The index path specifying the location of the cell in the table view
    /// - Returns: A dequeued cell of the specified type
    /// - Note: This method assumes the cell has been properly registered beforehand
    /// - Precondition: The cell type must have a valid reuseIdentifier
    /// - Throws: Fatal error if the dequeued cell cannot be cast to the specified type
    func dequeueReusableCell<T: UITableViewCell>(_: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("The dequeued cell is not an instance of \(T.self).")
        }
        return cell
    }
    
    /// Registers a cell type for reuse in the table view.
    /// - Parameter cellType: The type of cell to register (must inherit from UITableViewCell and conform to ReusableView)
    /// - Note: Supports both nib-based and programmatically created cells
    /// - Precondition: The cell type must conform to ReusableView protocol and provide a valid reuseIdentifier
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView {
        if let nib = T.nib {
            register(nib, forCellReuseIdentifier: T.reuseIdentifier)
        } else {
            register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
        }
    }
}
