//
//  AppSetting.swift
//  interview
//
//  Created by Anh Kiet on 17/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import Foundation

class AppSetting {
    
    static var isDarkMode: Bool {
        set {
            UserDefaults.standard.set(newValue, forKey: Key.UserDefault.isDarkMode.rawValue)
        }
        get {
            return UserDefaults.standard.bool(forKey: Key.UserDefault.isDarkMode.rawValue)
        }
    }
    
    static var isBiometricAuthentication: Bool {
        set {
            UserDefaults.standard.set(newValue, forKey: Key.UserDefault.isBiometricAuthentication.rawValue)
        }
        get {
            return UserDefaults.standard.bool(forKey: Key.UserDefault.isBiometricAuthentication.rawValue)
        }
    }
    
    static var isFastLoginEnabled: Bool {
        set {
            UserDefaults.standard.set(newValue, forKey: Key.UserDefault.isFastLoginEnabled.rawValue)
        }
        get {
            return UserDefaults.standard.bool(forKey: Key.UserDefault.isFastLoginEnabled.rawValue)
        }
    }
}
