//
//  CALayer+Theme.swift
//  SwiftTheme
//
//  Created by Huy Nguyen on 06/02/2023.
//  Copyright © 2023 Gesen. All rights reserved.
//

import Foundation
import QuartzCore

extension CALayer {
    /// Sets corner radius on CALayer
    ///
    /// Triggered by SwiftTheme when theme_cornerRadius is used.
    /// - Parameter value: a `ThemeCGFloatPicker` value
    ///
    /// Not called setCornerRadius so as not to conflict with existing func with same name.
    @objc func customSetCornerRadius(_ value: CGFloat) {
        cornerRadius = value
    }
}

@available(iOS 11.0, *)
extension CALayer {
    @objc func setCornerRadiusTopLeft(_ value: CGFloat) {
        var maskedCornerRadius = self.maskedCorners
        maskedCornerRadius.insert(.layerMinXMinYCorner)
        self.maskedCorners = maskedCornerRadius
    }

    @objc func setCornerRadiusTopRight(_ value: CGFloat) {
        var maskedCornerRadius = self.maskedCorners
        maskedCornerRadius.insert(.layerMaxXMinYCorner)
        self.maskedCorners = maskedCornerRadius
    }

    @objc func setCornerRadiusBottomLeft(_ value: CGFloat) {
        var maskedCornerRadius = self.maskedCorners
        maskedCornerRadius.insert(.layerMaxXMaxYCorner)
        self.maskedCorners = maskedCornerRadius
    }

    @objc func setCornerRadiusBottomRight(_ value: CGFloat) {
        var maskedCornerRadius = self.maskedCorners
        maskedCornerRadius.insert(.layerMaxXMaxYCorner)
        self.maskedCorners = maskedCornerRadius
    }
}

