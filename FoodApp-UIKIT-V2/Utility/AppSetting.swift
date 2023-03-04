//
//  AppSetting.swift
//  FoodApp-UIKIT-V2
//
//  Created by Macbook on 04/03/23.
//

import Foundation

class AppSetting {
    static let shared =  AppSetting()
    
    let kUserDefaults = UserDefaults.standard

    var isFirstTime: Bool {
        get {
            return kUserDefaults.value(forKey: "isFirstTime") as? Bool ?? true
        }
        set(_isNewDevice) {
            kUserDefaults.set(_isNewDevice, forKey: "isFirstTime")
            kUserDefaults.synchronize()
        }
    }
}
