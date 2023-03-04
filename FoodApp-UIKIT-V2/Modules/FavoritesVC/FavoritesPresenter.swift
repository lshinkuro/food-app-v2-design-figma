// 
//  FavoritesPresenter.swift
//  FoodApp-UIKIT-V2
//
//  Created by Macbook on 04/03/23.
//

import Foundation

class FavoritesPresenter {
    
    private let interactor: FavoritesInteractor
    private let router = FavoritesRouter()
    
    init(interactor: FavoritesInteractor) {
        self.interactor = interactor
    }
    
}
