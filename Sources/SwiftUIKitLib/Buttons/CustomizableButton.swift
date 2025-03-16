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
    /// A color gradient.
    case gradient([UIColor])
}

/**
 # CustomizableButton

 ## Overview
 `CustomizableButton` is a subclass of `UIButton` designed to be highly customizable. It supports different background styles, borders, and corner radius, making it easy to adjust the appearance of buttons in an iOS application.

 ## Features
 - Supports different background types: solid color, image, or gradient.
 - Allows setting custom borders with configurable width and color.
 - Provides a configurable corner radius.
 - Supports dynamic updates via the `layoutSubviews()` method.
 - Supports applying shadow with configurable properties.
 - Supports tap actions with a closure-based API.

 ## Enum: ButtonBackgroundType
 Defines the type of background that can be applied to a button.

 ### Cases:
 - `color(UIColor)`: Sets a solid background color.
 - `image(UIImage)`: Applies a background image.
 - `gradient([UIColor])`: Creates a gradient background with an array of colors.

 ## Class: CustomizableButton
 A customizable `UIButton` with added functionalities.

 ### Properties:
 - `backgroundType: ButtonBackgroundType?`: Stores the selected background type.
 - `borderWidth: CGFloat?`: Defines the width of the button's border (default: 0).
 - `borderColor: UIColor?`: Sets the border color (default: clear).
 - `cornerRadius: CGFloat?`: Defines the button's corner radius (default: 0).
 - `shadowOffset: CGSize`: Defines the shadow offset.
 - `shadowRadius: CGFloat`: Defines the shadow radius.
 - `shadowOpacity: Float`: Defines the shadow opacity.
 - `shadowColor: UIColor`: Defines the shadow color.
 - `tapAction: (() -> Void)?`: Closure executed when the button is tapped.

 ### Initialization:
 - `init(frame: CGRect)`: Standard initializer.
 - `required init?(coder: NSCoder)`: Required initializer for storyboard support.
 - `convenience init(frame: CGRect, title: String, font: UIFont, textColor: UIColor)`: Initializes the button with a title, font, and text color.

 ### Customization Methods
 - `setupWith(title: String, font: UIFont, textColor: UIColor)`: Configures the button with a title, font, and text color.
 - `setBackground(to type: ButtonBackgroundType)`: Sets the background type of the button.
 - `setBorder(with width: CGFloat, color: UIColor)`: Sets the border width and color.
 - `setCornerRadius(_ radius: CGFloat)`: Applies a corner radius to the button.
 - `setShadow(offset: CGSize, radius: CGFloat, opacity: Float, color: UIColor)`: Configures and applies a shadow to the button.
 - `setTapAction(_ action: @escaping () -> Void)`: Sets the tap action closure.

 ## Usage Example
 ```swift
 let button = CustomizableButton(frame: CGRect(x: 50, y: 100, width: 200, height: 50),
                                 title: "Click Me",
                                 font: .systemFont(ofSize: 18),
                                 textColor: .white)
 button.setBackground(to: .gradient([.blue, .purple]))
 button.setBorder(with: 2, color: .white)
 button.setCornerRadius(10)
 button.setShadow(offset: CGSize(width: 2, height: 2), radius: 4, opacity: 0.5, color: .black)
 button.setTapAction {
     print("Button tapped!")
 }
 ```
 */
public class CustomizableButton: UIButton {
    
    // MARK: - Properties
    private var backgroundType: ButtonBackgroundType?
    private var borderWidth: CGFloat? = 0
    private var borderColor: UIColor? = .clear
    private var cornerRadius: CGFloat? = 0
    private var shadowOffset: CGSize = .zero
    private var shadowRadius: CGFloat = 0
    private var shadowOpacity: Float = 0
    private var shadowColor: UIColor = .black
    private var tapAction: (() -> Void)?
    var activityIndicator: UIActivityIndicatorView?
    
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
        if let backgroundType = backgroundType {
            applyBackground(backgroundType)
        }
        applyBorder()
        applyCornerRadius()
        applyShadow()
    }
}

// MARK: Extension - Customization Methods
extension CustomizableButton {
    
    @objc public func setupWith(title: String, font: UIFont, textColor: UIColor) {
        setTitle(title, for: .normal)
        titleLabel?.font = font
        setTitleColor(textColor, for: .normal)
    }
    
    public func setBackground(to type: ButtonBackgroundType) {
        backgroundType = type
    }
    
    public func setBorder(with width: CGFloat, color: UIColor) {
        self.borderWidth = width
        self.borderColor = color
    }
    
    public func setCornerRadius(_ radius: CGFloat) {
        self.cornerRadius = radius
    }
    
    public func setShadow(offset: CGSize, radius: CGFloat, opacity: Float, color: UIColor) {
        self.shadowOffset = offset
        self.shadowRadius = radius
        self.shadowOpacity = opacity
        self.shadowColor = color
    }
    
    public func setTapAction(_ action: @escaping () -> Void) {
        self.tapAction = action
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
}

// MARK: Extension - Apply background
extension CustomizableButton {
    func applyBackground(_ background: ButtonBackgroundType) {
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
        case .gradient(let colors):
            applyGradient(colors: colors)
        }
    }
}

// MARK: Extension - Apply gradient
extension CustomizableButton {
    func applyGradient(colors: [UIColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = layer.cornerRadius
        
        // TODO: Check if this fixes gradient not visible : Trial 1
        // TODO: Issue was fixed, check and remove if not required
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        // TODO: Check if this fixes gradient not visible : Trial 2
        // TODO: Issue was fixed, check and remove if not required
        // Clear background color to ensure gradient is visible
        backgroundColor = nil
        setBackgroundImage(nil, for: .normal)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

// MARK: Extension - Apply border
extension CustomizableButton {
    func applyBorder() {
        if let width = self.borderWidth, let color = self.borderColor {
            layer.borderWidth = width
            layer.borderColor = color.cgColor
            layer.masksToBounds = true
        }
    }
}

// MARK: Extension - Apply corner radius
extension CustomizableButton {
    func applyCornerRadius() {
        if let radius = self.cornerRadius {
            self.layer.cornerRadius = radius
            self.layer.masksToBounds = true
        }
    }
}

// MARK: Extension - Apply shadow
extension CustomizableButton {
    func applyShadow() {
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = shadowOpacity
        layer.shadowColor = shadowColor.cgColor
        // Ensure the shadow is visible outside the button’s bounds.
        // If `masksToBounds` is true, the shadow will be clipped and not visible.
        layer.masksToBounds = false
    }
}

extension CustomizableButton {
    @objc private func buttonTapped() {
        tapAction?()
    }
}

// MARK: - Activity Indicator Methods
extension CustomizableButton {
    public func showLoadingIndicator() {
        if activityIndicator == nil {
            if #available(iOS 13.0, *) {
                activityIndicator = UIActivityIndicatorView(style: .medium)
            } else {
                // Fallback on earlier versions
                activityIndicator = UIActivityIndicatorView(style: .gray)
            }
            activityIndicator?.translatesAutoresizingMaskIntoConstraints = false
            addSubview(activityIndicator!)
            
            NSLayoutConstraint.activate([
                activityIndicator!.centerXAnchor.constraint(equalTo: centerXAnchor),
                activityIndicator!.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
        }
        setTitle(nil, for: .normal)
        isEnabled = false
        activityIndicator?.startAnimating()
    }
    
    public func hideLoadingIndicator(with title: String) {
        activityIndicator?.stopAnimating()
        activityIndicator?.removeFromSuperview()
        activityIndicator = nil
        setTitle(title, for: .normal)
        isEnabled = true
    }
}

public class CustomizableActivityButton: CustomizableButton {
    private let stackView = UIStackView()
    private let titleLabelContainer = UILabel()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupStackView()
    }
    
    public override func setupWith(title: String, font: UIFont, textColor: UIColor) {
        titleLabelContainer.text = title
        titleLabelContainer.font = font
        titleLabelContainer.textColor = textColor
    }
    
    private func setupStackView() {
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 8
        
        titleLabelContainer.textAlignment = .left
        activityIndicator?.hidesWhenStopped = true
        
        stackView.addArrangedSubview(titleLabelContainer)
        stackView.addArrangedSubview(activityIndicator ?? UIActivityIndicatorView(style: .gray))
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
