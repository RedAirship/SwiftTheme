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
              let attribute = newAttributes.attribute(for: .font, type: UIFont.self) else {
            return
        }
        let font = attribute.value
        let attributes = attribute.newAttributes

        /// Create new `NSMutableAttributedString` based on `attributedHtmlString` merge with new attributes
        let mutableString = NSMutableAttributedString(attributedString: attributedText)
        let range = NSMakeRange(0, mutableString.length)
        mutableString.enumerateAttributes(in: range, options: []) {
            (currentAttributes, range, _) in
            let mergedAttributes = currentAttributes.merge(with: attributes)
            mutableString.setAttributes(mergedAttributes, range: range)
        }

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

private extension Attributes {
    /// To get value for key parameter and remove that key/value from dictionary attributes
    /// - Parameters:
    ///   - key: A attribute string key
    ///   - type: A type for casting to that value
    /// - Returns: A tupe with value and new attributes after removed
    func attribute<T>(for key: NSAttributedString.Key, type: T.Type) -> (value: T, newAttributes: Attributes)? {
        guard let valueForKey = self[key] as? T else {
            return nil
        }
        var newAttributes = self
        newAttributes.removeValue(forKey: key)
        return (value: valueForKey, newAttributes: newAttributes)
    }
}
