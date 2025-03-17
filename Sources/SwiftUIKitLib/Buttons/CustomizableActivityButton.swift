//
//  CustomizableActivityButton.swift
//  SwiftUIKitLib
//
//  Created by Saurabh Verma on 16/03/25.
//

import Foundation
import UIKit

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
        stackView.isUserInteractionEnabled = false
        
        titleLabelContainer.textAlignment = .left
        stackView.addArrangedSubview(titleLabelContainer)
        
        activityIndicatorType = .withLabel
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

extension CustomizableActivityButton {
    public override func showLoadingIndicator() {
        if activityIndicator == nil {
            if #available(iOS 13.0, *) {
                activityIndicator = UIActivityIndicatorView(style: .medium)
            } else {
                // Fallback on earlier versions
                activityIndicator = UIActivityIndicatorView(style: .gray)
            }
            
            // Expand the button width if needed
            let newWidth = frame.width + 30
            let newFrame = CGRect(x: frame.origin.x - 15, y: frame.origin.y, width: newWidth, height: frame.height)

            UIView.animate(withDuration: 0.3, animations: {
                self.frame = newFrame
                self.titleLabelContainer.textAlignment = .left
                // TODO: Manage activityIndicator better than providing default if nil
                self.stackView.addArrangedSubview(self.activityIndicator ?? UIActivityIndicatorView(style: .gray))
                self.activityIndicator?.translatesAutoresizingMaskIntoConstraints = false
                self.activityIndicator?.startAnimating()
            })
        }
    }
    
    public override func hideLoadingIndicator(with title: String) {
        UIView.animate(withDuration: 0.3, animations: {
            self.titleLabelContainer.textAlignment = .center
            self.activityIndicator?.stopAnimating()
            self.stackView.removeArrangedSubview(self.activityIndicator ?? UIActivityIndicatorView(style: .gray))
            self.activityIndicator?.removeFromSuperview()
        })
    }
}
