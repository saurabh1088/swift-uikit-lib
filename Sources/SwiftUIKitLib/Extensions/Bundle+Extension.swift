//
//  File.swift
//  SwiftUIKitLib
//
//  Created by Saurabh Verma on 12/02/25.
//

import Foundation

/// Extensions to the `Bundle` class for accessing resources in Swift Packages.
public extension Bundle {
    
    /// The bundle representing the Swift Package module containing this library.
    ///
    /// This property provides a convenient way to access the bundle associated with the Swift Package
    /// (e.g., SwiftUIKitLib) when built as a module. It leverages `Bundle.module`, which is automatically
    /// generated by Swift Package Manager for resources included in the package.
    ///
    /// Use this property to load resources (e.g., images, nibs, or other files) bundled with the library,
    /// ensuring compatibility with Swift Package Manager's module system.
    ///
    /// - Note: This property assumes the code is part of a Swift Package with resources. If used outside
    ///   a package context or if no resources are defined, `Bundle.module` may fail at runtime.
    ///   Ensure the package's `Package.swift` includes resource declarations if needed.
    ///
    /// - Returns: The `Bundle` instance for the Swift Package module.
    ///
    /// Example:
    /// ```swift
    /// let image = UIImage(named: "icon", in: Bundle.packageBundleSwiftUIKitLib, with: nil)
    /// ```
    static var packageBundleSwiftUIKitLib: Bundle {
        return Bundle.module
    }
}
