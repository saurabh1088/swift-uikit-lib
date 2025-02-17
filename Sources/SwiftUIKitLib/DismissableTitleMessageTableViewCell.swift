//
//  DismissableTitleMessageTableViewCell.swift
//  SwiftUIKitLib
//
//  Created by Saurabh Verma on 17/02/25.
//

#if canImport(UIKit)

import UIKit

class DismissableTitleMessageTableViewCell: UITableViewCell {

    @IBOutlet weak var leadingIconImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var dismissButton: UIButton!
    
    @IBOutlet weak var actionButton: UIButton!
    
    var dismissAction: (() -> Void)?
    var actionButtonAction: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension DismissableTitleMessageTableViewCell {
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

#endif
