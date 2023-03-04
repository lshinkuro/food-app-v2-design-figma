//
//  SceneDelegate.swift
//  FoodApp-UIKIT-V2
//
//  Created by Macbook on 03/03/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        if AppSetting.shared.isFirstTime {
            createOnboardingVC()
        } else {
            window.rootViewController = MainTabBarViewController()
            self.window = window
            window.makeKeyAndVisible()
        } 
//        setupNavigationBar()
    }
    
    func createOnboardingVC() {
        let vc = OnBoardingRouter().showView()
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
    }
    

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    func setupNavigationBar() {
        let lineShadowColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let shadowImage = UIImage()
        
        if #available(iOS 15.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor.gray
            appearance.shadowColor = lineShadowColor
            appearance.shadowImage = shadowImage
            appearance.backgroundImage = UIImage(named: "onboard-1")
            appearance.titleTextAttributes = [
                .foregroundColor: UIColor.white as Any,
                .font: UIFont(name: "Futura", size: 17)!
            ]            
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        } else {
            // swiftlint:disable:next line_length
            UINavigationBar.appearance().setBackgroundImage(UIImage(named: "navbar-bg")!.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), resizingMode: .stretch), for: .default)
            UINavigationBar.appearance().barTintColor = UIColor.white
            UINavigationBar.appearance().shadowImage = shadowImage
        }

        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white as Any,
            NSAttributedString.Key.font: UIFont(name: "Futura", size: 17)!
        ]
        
        // Set the content insets of the tab bar items
        let tabBarController = MainTabBarViewController()
        if let items = tabBarController.tabBar.items {
            for item in items {
                item.imageInsets = UIEdgeInsets(top: 6.0, left: 0.0, bottom: -6.0, right: 0.0)
                item.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -6.0)
            }
        }

        let barButtonAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.clear,
            NSAttributedString.Key.font: UIFont(name: "Futura", size: 0.1)!
        ]
        UIBarButtonItem.appearance().setTitleTextAttributes(barButtonAttributes, for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes(barButtonAttributes, for: .highlighted)
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -1000.0, vertical: 0.0), for: .default)
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = UIColor.white
        
    }


}

