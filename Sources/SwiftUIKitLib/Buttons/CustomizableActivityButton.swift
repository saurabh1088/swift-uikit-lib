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
        
        if #available(iOS 13.0, *) {
            activityIndicator = UIActivityIndicatorView(style: .medium)
        } else {
            // Fallback on earlier versions
            activityIndicator = UIActivityIndicatorView(style: .gray)
        }
        
        titleLabelContainer.textAlignment = .left
        activityIndicator?.hidesWhenStopped = true
        
        stackView.addArrangedSubview(titleLabelContainer)
        stackView.addArrangedSubview(activityIndicator ?? UIActivityIndicatorView(style: .gray))
        
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
