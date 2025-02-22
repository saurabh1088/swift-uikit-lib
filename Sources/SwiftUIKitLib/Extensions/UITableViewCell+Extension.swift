//
//  File.swift
//  SwiftUIKitLib
//
//  Created by Saurabh Verma on 20/02/25.
//

import UIKit

public extension UITableViewCell {
    static var reuseIdentifier: String {
        String(describing: self)
    }
    
    static var nibName: String {
        return String(describing: self)
    }
    
    static var nib: UINib? {
        let bundle = Bundle(for: self)
        if bundle.path(forResource: nibName, ofType: "nib") != nil {
            return UINib(nibName: nibName, bundle: bundle)
        }
        return nil
    }
}
