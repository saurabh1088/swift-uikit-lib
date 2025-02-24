//
//  File.swift
//  SwiftUIKitLib
//
//  Created by Saurabh Verma on 20/02/25.
//

import UIKit

public extension UITableViewCell {
    /// Provides a default reuse identifier for the cell class.
    /// - Returns: A string representation of the cell's class name
    /// - Note: This serves as a default implementation that can be overridden
    ///   by subclasses if a custom identifier is needed
    static var reuseIdentifier: String {
        String(describing: self)
    }
    
    /// Generates the default nib name based on the cell's class name.
    /// - Returns: A string matching the cell's class name
    /// - Note: Assumes the nib file name matches the class name
    ///   when using nib-based cells
    static var nibName: String {
        return String(describing: self)
    }
    
    /// Attempts to load and return a UINib object for the cell if it exists.
    /// - Returns: An optional UINib instance if a matching nib file is found,
    ///   nil otherwise
    /// - Note: Checks the bundle containing the cell class for a nib file
    ///   matching the class name
    static var nib: UINib? {
        let bundle = Bundle(for: self)
        if bundle.path(forResource: nibName, ofType: "nib") != nil {
            return UINib(nibName: nibName, bundle: bundle)
        }
        return nil
    }
}
