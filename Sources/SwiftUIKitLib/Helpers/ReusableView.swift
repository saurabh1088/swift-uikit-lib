//
//  File.swift
//  SwiftUIKitLib
//
//  Created by Saurabh Verma on 22/02/25.
//

import Foundation
import UIKit

protocol ReusableView: AnyObject {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self)
    }
}
