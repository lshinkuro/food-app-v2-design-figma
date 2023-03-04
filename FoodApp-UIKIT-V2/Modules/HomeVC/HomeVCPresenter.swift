// 
//  HomeVCPresenter.swift
//  FoodApp-UIKIT-V2
//
//  Created by Macbook on 04/03/23.
//

import Foundation

class HomeVCPresenter {
    
    private let interactor: HomeVCInteractor
    private let router = HomeVCRouter()
    
    init(interactor: HomeVCInteractor) {
        self.interactor = interactor
    }
    
}
