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
    /// Logic function to check if initialize all masked corner radius
    /// - Parameters:
    ///   - cornerMask: specific corner.
    ///   - radiusValue: corner radius value.
    private func setCornerRadiusSpecific(_ cornerMask: CACornerMask,_ radiusValue: CGFloat) {
        var maskedCornerRadius: CACornerMask
        let allCorners: CACornerMask = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        if self.maskedCorners.contains(allCorners) {
            maskedCornerRadius = [cornerMask]
        } else {
            maskedCornerRadius = self.maskedCorners
            maskedCornerRadius.insert(cornerMask)
        }
        self.cornerRadius = radiusValue
        self.maskedCorners = maskedCornerRadius
    }

    /// Sets corner radius on CALayer
    ///
    /// Triggered by SwiftTheme when `theme_cornerRadiusTopLeft` is used.
    /// - Parameter value: a `ThemeCGFloatPicker` value
    ///
    @objc func setCornerRadiusTopLeft(_ value: CGFloat) {
        self.setCornerRadiusSpecific(.layerMinXMinYCorner, value)
    }

    /// Sets corner radius on CALayer
    ///
    /// Triggered by SwiftTheme when `theme_cornerRadiusTopRight` is used.
    /// - Parameter value: a `ThemeCGFloatPicker` value
    ///
    @objc func setCornerRadiusTopRight(_ value: CGFloat) {
        self.setCornerRadiusSpecific(.layerMaxXMinYCorner, value)
    }

    /// Sets corner radius on CALayer
    ///
    /// Triggered by SwiftTheme when `theme_cornerRadiusBottomLeft` is used.
    /// - Parameter value: a `ThemeCGFloatPicker` value
    ///
    @objc func setCornerRadiusBottomLeft(_ value: CGFloat) {
        self.setCornerRadiusSpecific(.layerMaxXMaxYCorner, value)
    }

    /// Sets corner radius on CALayer
    ///
    /// Triggered by SwiftTheme when `theme_cornerRadiusBottomRight` is used.
    /// - Parameter value: a `ThemeCGFloatPicker` value
    ///
    @objc func setCornerRadiusBottomRight(_ value: CGFloat) {
        self.setCornerRadiusSpecific(.layerMaxXMaxYCorner, value)
    }
}

