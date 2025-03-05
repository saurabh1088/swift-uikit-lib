//
//  CustomizableButton.swift
//  SwiftUIKitLib
//
//  Created by Saurabh Verma on 04/03/25.
//

import UIKit

/**
 A highly customizable button built on top of UIButton, supporting various styles, states, and interactions.
 */
public class CustomizableButton: UIButton {
    
    // MARK: - Properties
    
    // MARK: - Initialization
    
    // MARK: - Customization Methods
    
    public func setupWith(title: String, font: UIFont, textColor: UIColor) {
        setTitle(title, for: .normal)
        titleLabel?.font = font
        setTitleColor(textColor, for: .normal)
    }
    
    public func applyBackgroundColor(_ color: UIColor) {
        backgroundColor = color
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
