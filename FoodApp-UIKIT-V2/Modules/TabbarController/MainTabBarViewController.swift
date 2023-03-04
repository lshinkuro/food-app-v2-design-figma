//
//  MainTabBarController.swift
//  FoodApp-UIKIT-V2
//
//  Created by Macbook on 04/03/23.
//

import Foundation
import UIKit

class MainTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    
    private let mainTabBarController = MainTabBarController()
    
    
    private var selectedTab: MainTabBarType = .home {
        didSet {
            title = selectedTab.title
        }
    }
    
    init(tab: MainTabBarType = .home) {
        selectedTab = tab
        super.init(nibName: nil, bundle: nil)
        title = tab.title
        navigationItem.backButtonTitle = ""
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setNavBarAction()
        createTabBarController()
    }
    
   private func setNavBarAction() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "people"),
            style: .plain, target: self, action: #selector(notifTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "menu"),
            style: .plain, target: self, action: #selector(menuButtonTapped))
    }
    
    @objc func menuButtonTapped() {
        print("action menu")
    }
    
    // MARK: this func temporary
    @objc func notifTapped() {
        print("action notif")
    }

    // MARK: end of temporary func

    private func createTabBarController() {
        /*
         From iOS 15, tab bar will have a default scroll edge appearance that makes it transparent
         if scrolled to edge. setting this custom appearance will remove this transparent behavior globally.
         To do this, we need to create a custom appearance and set it to the scrollEdgeAppearance.
         */
        #if canImport(GroupActivities)
            if #available(iOS 15.0, *) {
                let appearance = UITabBarAppearance()
                appearance.configureWithOpaqueBackground()
                appearance.backgroundColor = .white
                UITabBar.appearance().standardAppearance = appearance
                UITabBar.appearance().scrollEdgeAppearance = appearance
            } else {
                tabBar.barTintColor = .white
            }
        #else
            tabBar.barTintColor = UIColor.init(hexaRGB: "#BCC8E7")
        #endif

        tabBar.isTranslucent = false
        
        // Initial set up of tab bar controllers
        viewControllers = mainTabBarController.getViewControllers()
        
        // Initial set up of selected index
        selectedIndex = selectedTab.index
        tabBar.barTintColor = UIColor.gray
        mainTabBarController.setupTabBarItems(tabBar, selectedIndex: selectedIndex)
    }
    
    public func tabBarController(_ tabBarController: UITabBarController, didSelect _: UIViewController) {
        selectedTab = mainTabBarController.findType(byIndex: tabBarController.selectedIndex)
    }
}
