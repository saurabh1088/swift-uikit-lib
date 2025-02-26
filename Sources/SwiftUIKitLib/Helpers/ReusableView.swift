//
//  File.swift
//  SwiftUIKitLib
//
//  Created by Saurabh Verma on 22/02/25.
//

import Foundation
import UIKit

/// A protocol that defines a reusable view with a default reuse identifier.
/// Conforming types can be used in scenarios where views need to be reused,
/// such as in table views or collection views.
public protocol ReusableView: AnyObject {
    static var defaultReuseIdentifier: String { get }
}

/// An extension that provides a default implementation of `ReusableView`
/// for types that inherit from `UIView`.
public extension ReusableView where Self: UIView {
    /// Returns a default reuse identifier based on the class name of the view.
    /// This implementation uses `NSStringFromClass` to generate a unique
    /// identifier string from the view's class.
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self)
    }
}
