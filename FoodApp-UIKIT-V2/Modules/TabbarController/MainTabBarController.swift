//
//  MainTabBarController.swift
//  FoodApp-UIKIT-V2
//
//  Created by Macbook on 04/03/23.
//

import Foundation
import UIKit


class MainTabBarController: NSObject {
    
    let tabBarItemsData: [MainTabBarType] = [
        .home, .favorites, .notification, .order
    ]
    
    let home = UINavigationController(rootViewController: HomeVCRouter().showView() )
    let favorites = UINavigationController(rootViewController: FavoritesRouter().showView())
    let notification = UINavigationController(rootViewController: NotificationRouter().showView() )
    let order = UINavigationController(rootViewController: OrderRouter().showView())
    
    func getViewControllers() -> [UIViewController] {
        return [home, favorites, notification, order]
    }
    
    public func setupTabBarItems(_ tabBar: UITabBar, selectedIndex _: Int) {
        guard let tabBarItems = tabBar.items else { return }

        zip(tabBarItemsData.indices, tabBarItemsData).forEach { index, tabBarType in
            let tabBarItem = tabBarItems[index]
            
            setupTabBarItemAppearance(tabBarItem: tabBarItem, type: tabBarType)
            tabBarItem.title = tabBarType.title
            tabBarItem.image = tabBarType.image()
            tabBarItem.selectedImage =  tabBarType.selectedImage()
        }
    }
    
    private func setupTabBarItemAppearance(tabBarItem: UITabBarItem, type _: MainTabBarType) {
        let selectedTextColor: UIColor = UIColor.gray
        let selectedAttributes = [NSAttributedString.Key.foregroundColor: selectedTextColor]
        let normalAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]

        /*
         Modifying the attributes directly on the tab bar item won't work in iOS 15 after setting up the appearance,
         To make this to work, we must set it using the appearance API.
         */
        #if canImport(GroupActivities)
            if #available(iOS 15.0, *) {
                let appearance = UITabBar.appearance().standardAppearance // Use the standard global appearance

                // If we dont set the font, the title bounds calculation may be wrong resulting in truncated text
                // Standard stacked layout
                appearance.stackedLayoutAppearance.selected.titleTextAttributes = selectedAttributes
                appearance.stackedLayoutAppearance.selected.titleTextAttributes
                    .updateValue(UIFont.systemFont(ofSize: 10, weight: .medium), forKey: .font)

                appearance.stackedLayoutAppearance.normal.titleTextAttributes = normalAttributes as [NSAttributedString.Key: Any]
                appearance.stackedLayoutAppearance.normal.titleTextAttributes
                    .updateValue(UIFont.systemFont(ofSize: 10, weight: .medium), forKey: .font)

                // Inline layout
                appearance.inlineLayoutAppearance.selected.titleTextAttributes = selectedAttributes
                appearance.inlineLayoutAppearance.selected.titleTextAttributes
                    .updateValue(UIFont.systemFont(ofSize: 13, weight: .medium), forKey: .font)

                appearance.inlineLayoutAppearance.normal.titleTextAttributes = normalAttributes as [NSAttributedString.Key: Any]
                appearance.inlineLayoutAppearance.normal.titleTextAttributes
                    .updateValue(UIFont.systemFont(ofSize: 13, weight: .medium), forKey: .font)

                // Inline layout (compact)
                appearance.compactInlineLayoutAppearance.selected.titleTextAttributes = selectedAttributes
                appearance.compactInlineLayoutAppearance.selected.titleTextAttributes
                    .updateValue(UIFont.systemFont(ofSize: 12, weight: .medium), forKey: .font)

                appearance.compactInlineLayoutAppearance.normal.titleTextAttributes = normalAttributes as [NSAttributedString.Key: Any]
                appearance.compactInlineLayoutAppearance.normal.titleTextAttributes
                    .updateValue(UIFont.systemFont(ofSize: 12, weight: .medium), forKey: .font)

                tabBarItem.standardAppearance = appearance
                tabBarItem.scrollEdgeAppearance = appearance
            } else {
                tabBarItem.setTitleTextAttributes(selectedAttributes, for: .selected)
                tabBarItem.setTitleTextAttributes(normalAttributes as [NSAttributedString.Key: Any], for: .normal)
            }
        #else
            tabBarItem.setTitleTextAttributes(selectedAttributes, for: .selected)
            tabBarItem.setTitleTextAttributes(normalAttributes, for: .normal)
        #endif
    }
    
    internal func findType(byIndex index: Int) -> MainTabBarType {
        return tabBarItemsData.first(where: { $0.index == index }) ?? .home
    }
}



