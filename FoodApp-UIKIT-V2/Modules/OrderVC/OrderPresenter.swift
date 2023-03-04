// 
//  OrderPresenter.swift
//  FoodApp-UIKIT-V2
//
//  Created by Macbook on 04/03/23.
//

import Foundation

class OrderPresenter {
    
    private let interactor: OrderInteractor
    private let router = OrderRouter()
    
    init(interactor: OrderInteractor) {
        self.interactor = interactor
    }
    
}
