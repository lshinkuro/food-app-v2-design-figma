// 
//  OnBoardingPresenter.swift
//  FoodApp-UIKIT-V2
//
//  Created by Macbook on 04/03/23.
//

import Foundation

class OnBoardingPresenter {
    
    private let interactor: OnBoardingInteractor
    private let router = OnBoardingRouter()
    
    init(interactor: OnBoardingInteractor) {
        self.interactor = interactor
    }
    
}
