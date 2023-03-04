// 
//  NotificationPresenter.swift
//  FoodApp-UIKIT-V2
//
//  Created by Macbook on 04/03/23.
//

import Foundation

class NotificationPresenter {
    
    private let interactor: NotificationInteractor
    private let router = NotificationRouter()
    
    init(interactor: NotificationInteractor) {
        self.interactor = interactor
    }
    
}
