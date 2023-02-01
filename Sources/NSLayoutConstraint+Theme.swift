//
//  NSLayoutConstraint+Theme.swift
//
//  Setters used by ThemePickers operating on NSLayoutConstraint.
//
//  Created by Ryan Tan on 29/11/22.
//

#if os(iOS)
import UIKit
extension NSLayoutConstraint {

    /// Sets constant for the constraint.
    ///
    /// Triggered by SwiftTheme when theme_constraintConstant is used.
    @objc func setConstraintConstant(_ value: CGFloat) {
        constant = value
    }
}
#endif
