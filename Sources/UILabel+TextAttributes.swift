//
//  UILabel+TextAttributes.swift
//  SwiftTheme
//
//  Created by Gesen on 2019/9/1.
//  Copyright © 2019 Gesen. All rights reserved.
//

import UIKit

public let IsUppercaseKey = NSAttributedString.Key(rawValue: "isUppercase")

extension UILabel {
    @objc func updateTextAttributes(_ newAttributes: [NSAttributedString.Key: Any]) {
        guard let text = self.attributedText else { return }
        let attributedString = NSAttributedString(
            attributedString: text,
            merging: newAttributes
        )

        if newAttributes[IsUppercaseKey] as? Bool == true {
            self.attributedText = attributedString.uppercased()
        } else {
            self.attributedText = attributedString
        }
    }
}
