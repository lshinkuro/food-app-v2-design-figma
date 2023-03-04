// 
//  NotificationRouter.swift
//  FoodApp-UIKIT-V2
//
//  Created by Macbook on 04/03/23.
//

import UIKit

class NotificationRouter {
    
    func showView() -> NotificationView {
        let interactor = NotificationInteractor()
        let presenter = NotificationPresenter(interactor: interactor)
        let view = NotificationView(nibName: String(describing: NotificationView.self), bundle: nil)
        view.presenter = presenter
        return view
    }
    
    //Navigate to other xib-based router
    /*
    func navigateToOtherView(from navigation: UINavigationController, with data: Any) {
        let otherView = OtherViewRouter().showView(with: data)
        navigation.pushViewController(otherView, animated: true)
    }
    */
    
    //Navigate to other storyboard-based router
    /*
    func navigateToOtherView(from navigation: UINavigationController, with data: Any) {
        let otherView = OtherViewRouter().showView(with: data)
        navigation.pushViewController(otherView, animated: true)
    }
     */
    
}
