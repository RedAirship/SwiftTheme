//
//  UITabBarItem+Theme.swift
//  SwiftTheme
//
//  Created by Huy Nguyen on 06/02/2023.
//  Copyright © 2023 Gesen. All rights reserved.
//

import UIKit

#if os(iOS)
extension UITabBarItem {

    /// Sets vertical value for titlePositionAdjustment.
    ///
    /// Triggered by SwiftTheme when `theme_titlePositionAdjustmentVertical` is used.
    @objc func setTitlePositionAdjustmentVertical(_ value: CGFloat) {
        titlePositionAdjustment = UIOffset(horizontal: 0, vertical: value)
    }

    /// Sets negative vertical value for titlePositionAdjustment.
    ///
    /// Triggered by SwiftTheme when `theme_titlePositionAdjustmentVerticalNegative` is used.
    @objc func setTitlePositionAdjustmentVerticalNegative(_ value: CGFloat) {
        titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -value)
    }
}
#endif

