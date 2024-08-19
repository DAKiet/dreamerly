//
//  Constant.swift
//  interview
//
//  Created by Anh Kiet on 17/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import UIKit

class Constant {
    
    struct Device {
        static let id: String = UIDevice.current.identifierForVendor?.uuidString ?? "undefined"
        static let name: String = UIDevice.current.name.folding(options: .diacriticInsensitive, locale: .current)
        static let model: String = UIDevice.current.model
        static let version: String = UIDevice.current.systemVersion
        static let screenBounds = UIScreen.main.bounds
    }
    
    static var isDebug: Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }
    
    static let bundleId = Bundle.main.infoDictionary?["CFBundleIdentifier"] as? String ?? "com.dakiet.dreamerly"
    static let appVersion: String = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "undefined"
    static let appBuildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "undefined"
    static let appName: String = "Dreamerly"
}

struct GlobalData {
    var tasks: [TaskModel] = []
    var notifications: [NotificationModel] = []
}

var globalData: GlobalData = .init()
