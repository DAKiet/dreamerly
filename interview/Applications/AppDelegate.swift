//
//  AppDelegate.swift
//  interview
//
//  Created by Anh Kiet on 17/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        getNotifications()
        getTasks()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = RootViewController(at: .home)
        window?.makeKeyAndVisible()
        
        return true
    }
    
    private func getTasks() {
        guard
            let tasks: [TaskModel] = try? Helper.readJSONFile(forName: "tasks")
        else { return }
        
        globalData.tasks = tasks
    }
    
    private func getNotifications() {
        guard
            let notifications: [NotificationModel] = try? Helper.readJSONFile(forName: "notifications")
        else { return }
        
        globalData.notifications = notifications
    }
}
