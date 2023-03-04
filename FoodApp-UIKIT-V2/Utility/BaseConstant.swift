//
//  BaseConstant.swift
//  FoodApp-UIKIT-V2
//
//  Created by Macbook on 04/03/23.
//

import Foundation
import UIKit

class BaseConstant {
  static let baseUrl = "https://api.spacexdata.com/v4"
}

enum SFSymbols {
    static let homeSymbol = UIImage(systemName: "house")
    static let favoriteSymbol = UIImage(systemName: "heart")
    static let notificationSymbol = UIImage(systemName: "bell")
    static let orderSymbol = UIImage(systemName: "basket")
    
    static let arrowSymbol = UIImage(systemName: "arrow.right.circle.fill")
    static let statusSymbol = UIImage(systemName: "circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 8, weight: .regular, scale: .default))
}

enum ScreenSize {
    static let width        = UIScreen.main.bounds.size.width
    static let height       = UIScreen.main.bounds.size.height
    static let maxLength    = max(ScreenSize.width, ScreenSize.height)
    static let minLength    = min(ScreenSize.width, ScreenSize.height)
}
