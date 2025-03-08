//
//  CustomizableButton.swift
//  SwiftUIKitLib
//
//  Created by Saurabh Verma on 04/03/25.
//

import UIKit

/// Defines the type of background to apply to the button.
public enum ButtonBackgroundType {
    /// A solid background color.
    case color(UIColor)
    /// A background image.
    case image(UIImage)
}

/**
 A highly customizable button built on top of UIButton, supporting various styles, states, and interactions.
 */
public class CustomizableButton: UIButton {
    
    // MARK: - Properties
    
    // MARK: - Initialization
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public convenience init(frame: CGRect, title: String, font: UIFont, textColor: UIColor) {
        self.init(frame: frame)
        setupWith(title: title, font: font, textColor: textColor)
    }
    
    // TODO: Check if this fixes gradient not visible : Trial 3
    public override func layoutSubviews() {
        super.layoutSubviews()
        applyGradient(colors: [UIColor.red, UIColor.blue])
    }
    
    // MARK: - Customization Methods
    public func setupWith(title: String, font: UIFont, textColor: UIColor) {
        setTitle(title, for: .normal)
        titleLabel?.font = font
        setTitleColor(textColor, for: .normal)
    }
    
    public func applyBackground(_ background: ButtonBackgroundType) {
        switch background {
            case .color(let color):
            backgroundColor = color
            setBackgroundImage(nil, for: .normal) // Clear any existing background image
        case .image(let image):
            if #available(iOS 15.0, *) {
                var buttonConfig = configuration ?? UIButton.Configuration.plain()
                buttonConfig.background.image = image
                configuration = buttonConfig
            } else {
                // Fallback on earlier versions
                setBackgroundImage(image, for: .normal)
                backgroundColor = nil // Clear any existing background color
            }
        }
    }
    
    public func applyGradient(colors: [UIColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = layer.cornerRadius
        
        // TODO: Check if this fixes gradient not visible : Trial 1
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        // TODO: Check if this fixes gradient not visible : Trial 2
        // Clear background color to ensure gradient is visible
        backgroundColor = nil
        setBackgroundImage(nil, for: .normal)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
