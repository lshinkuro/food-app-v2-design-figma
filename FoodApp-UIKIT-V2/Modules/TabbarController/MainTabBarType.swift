//
//  MainTabBarType.swift
//  FoodApp-UIKIT-V2
//
//  Created by Macbook on 04/03/23.
//

import Foundation
import UIKit

enum MainTabBarType {
    case home
    case favorites
    case notification
    case order
}

extension MainTabBarType {
    var index: Int {
        switch self {
        case .home: return 0
        case .favorites: return 1
        case .notification: return 2
        case .order: return 3
        }
    }
    
    var title: String {
        switch self {
        case .home: return "Beranda"
        case .favorites: return "Favorites"
        case .notification: return "Notification"
        case .order: return "Order"
        }
    }
    
    func image() -> UIImage? {
        let image: UIImage?
        switch self {
        case .home:
            image = SFSymbols.homeSymbol
        case .favorites:
            image = SFSymbols.favoriteSymbol
        case .notification:
            image = SFSymbols.notificationSymbol
        case .order:
            image = SFSymbols.orderSymbol
        }
        return image?.withRenderingMode(.alwaysOriginal)
    }
    
    func selectedImage() -> UIImage? {
        let image: UIImage?
        switch self {
        case .home:
            image = UIImage(systemName: "house.fill")
        case .favorites:
            image = UIImage(systemName: "heart.fill")
        case .notification:
            image = UIImage(systemName: "bell.fill")
        case .order:
            image = UIImage(systemName: "basket.fill")
        }
        return image?.withRenderingMode(.alwaysOriginal)
    }
    
}

