//
//  UITextView+TextAttributes.swift
//  SwiftTheme
//
//  Created by Huy Nguyen on 12/06/2023.
//  Copyright © 2023 Huy Nguyen. All rights reserved.
//

import UIKit

typealias Attributes = [NSAttributedString.Key: Any]

extension UITextView {
    @objc func updateTextViewTextAttributes(_ newAttributes: Attributes) {
        guard let attributedText = self.attributedText,
              let font = newAttributes[.font] as? UIFont else {
            return
        }

        /// Create new `NSMutableAttributedString` based on `attributedHtmlString` merge with new attributes
        let mutableString = NSMutableAttributedString(attributedString: attributedText)
        let range = NSMakeRange(0, mutableString.length)

        /// Replace for `font` and `link` from `NSMutableAttributedString`
        mutableString.beginEditing()
        mutableString.enumerateAttribute(.font, in: range) { value, range, _ in
            if let attributeFont = value as? UIFont, let fontDescriptor = attributeFont.fontDescriptor
                .withFamily(font.familyName)
                .withSymbolicTraits(attributeFont.fontDescriptor.symbolicTraits) {
                let newFont = UIFont(descriptor: fontDescriptor, size: font.pointSize)
                mutableString.removeAttribute(.font, range: range)
                mutableString.addAttribute(.font, value: newFont, range: range)
            }
        }
        mutableString.enumerateAttribute(.link, in: range) { value, range, _ in
            if value != nil {
                mutableString.removeAttribute(.font, range: range)
                mutableString.addAttribute(.font, value: font, range: range)
            }
        }
        mutableString.endEditing()

        self.attributedText = mutableString
    }

    @objc func setTextLinkColor(_ color: UIColor) {
        self.linkTextAttributes = [
            .underlineStyle: 0,
            .underlineColor: UIColor.clear,
            .foregroundColor: color
        ]
    }
}
