//
//  UIViewExt.swift
//  FoodApp-UIKIT-V2
//
//  Created by Macbook on 04/03/23.
//

import UIKit

extension UIView {
    func makeCornerRadius(_ radius: CGFloat, maskedCorner: CACornerMask?) {
        layer.cornerRadius = radius
        layer.maskedCorners = maskedCorner ?? [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
        clipsToBounds = true
    }
}
