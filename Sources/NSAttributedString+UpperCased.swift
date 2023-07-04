//
//  NSAttributedString+UpperCased.swift
//  SwiftTheme
//
//  Created by Nozomu Kuwae on 2023/07/04.
//  Copyright © 2023 Gesen. All rights reserved.
//

import Foundation

extension NSAttributedString {
    /// Reference: cocoa - how to change characters case to Upper in NSAttributedString - Stack Overflow
    /// https://stackoverflow.com/questions/6716699/how-to-change-characters-case-to-upper-in-nsattributedstring
    func uppercased() -> NSAttributedString {
        let result = NSMutableAttributedString(attributedString: self)
        result.enumerateAttributes(in: NSRange(location: 0, length: length), options: []) {_, range, _ in
            result.replaceCharacters(in: range, with: (string as NSString).substring(with: range).uppercased())
        }
        return result
    }
}
