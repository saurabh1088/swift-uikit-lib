//
//  DismissableTitleMessageTableViewCell.swift
//  SwiftUIKitLib
//
//  Created by Saurabh Verma on 17/02/25.
//

#if canImport(UIKit)

import UIKit

public class DismissableTitleMessageTableViewCell: UITableViewCell {

    @IBOutlet weak var leadingIconImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var dismissButton: UIButton!
    
    @IBOutlet weak var actionButton: UIButton!
    
    var dismissAction: (() -> Void)?
    var actionButtonAction: (() -> Void)?
    
    public override func awakeFromNib() {
        super.awakeFromNib()
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // IBAction for dismiss button
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        dismissAction?()
    }
    
    // IBAction for action button
    @IBAction func actionButtonTapped(_ sender: UIButton) {
        actionButtonAction?()
    }
}

public extension DismissableTitleMessageTableViewCell {
    func configure(with title: String,
                   message: String,
                   icon: UIImage?,
                   dismissAction: (() -> Void)? = nil,
                   actionButtonAction: (() -> Void)? = nil) {
        titleLabel.text = title
        messageLabel.text = message
        leadingIconImageView.image = icon
        self.dismissAction = dismissAction
        self.actionButtonAction = actionButtonAction
    }
}

public extension DismissableTitleMessageTableViewCell {
    // Computed property for dismissButton
    var dismissButtonControl: UIButton {
        return dismissButton
    }
    
    // Computed property for actionButton
    var actionButtonControl: UIButton {
        return actionButton
    }
}

#endif
