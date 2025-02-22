//
//  SingleDetailTableViewCell.swift
//  SwiftUIKitLib
//
//  Created by Saurabh Verma on 05/02/25.
//

/**
 This file defines `SingleDetailTableViewCell`, a custom subclass of `UITableViewCell` for iOS applications.
 It uses conditional compilation to ensure the code is only compiled for platforms where UIKit is available.

 - Note: This class is designed for use in iOS environments only, as it depends on UIKit.
 */
#if canImport(UIKit)

import UIKit

public class SingleDetailTableViewCell: UITableViewCell, ReusableView {
    
    @IBOutlet weak var detailLabel: UILabel!
    
    public override func awakeFromNib() {
        super.awakeFromNib()
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func setDetailText(_ text: String) {
        detailLabel.text = text
    }
    
    public func configureDetailLabel(text: String,
                                     font: UIFont = .systemFont(ofSize: 17.0),
                                     textColor: UIColor = .black,
                                     backgroundColor: UIColor = .white) {
        detailLabel.text = text
        detailLabel.font = font
        detailLabel.textColor = textColor
        self.backgroundColor = backgroundColor
    }
}

#endif
