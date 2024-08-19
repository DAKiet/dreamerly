//
//  RootViewController.swift
//  interview
//
//  Created by Anh Kiet on 17/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import UIKit

enum TabbarType: Int, CaseIterable {
    case home = 0
    case tasks
    case setting
}

final class RootViewController: UITabBarController {
    
    // MARK: Properties
    var tabbarType: TabbarType {
        didSet {
            self.selectedIndex = tabbarType.rawValue
        }
    }
    
    // MARK: Initialization
    init(at tabbarType: TabbarType) {
        self.tabbarType = tabbarType
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("Dealloc \(identifier)")
    }
    
    // MARK: Life cycle
    override func loadView() {
        super.loadView()
        
        overrideUserInterfaceStyle = AppSetting.isDarkMode ? .dark : .light
        
        let controllers = listViewController()
        setViewControllers(controllers, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.clipsToBounds = true
        tabBar.isTranslucent = false
        tabBar.tintColor = .appColor(.primary)
        tabBar.unselectedItemTintColor = .appColor(.primary).withAlphaComponent(0.3)
        tabBar.barTintColor = .appColor(.tabbarBackground)
        tabBar.backgroundColor = .appColor(.tabbarBackground)
        selectedIndex = tabbarType.rawValue
    }
    
    private func listViewController() -> [UIViewController] {
        var viewControllers: [UIViewController] = []
        
        TabbarType.allCases.forEach {
            switch $0 {
            case .home:
                let homeVC = HomeViewController()
                let navigationController = BaseNavigationController(rootViewController: homeVC)
                navigationController.tabBarItem.title = "Home"
                navigationController.tabBarItem.image = UIImage(systemName: "homekit")
                viewControllers.append(navigationController)
            case .tasks:
                let tasksVC = TasksViewController()
                let navigationController = BaseNavigationController(rootViewController: tasksVC)
                navigationController.tabBarItem.title = "Tasks"
                navigationController.tabBarItem.image = UIImage(systemName: "calendar.badge.clock")
                viewControllers.append(navigationController)
            case .setting:
                let settingVC = SettingViewController()
                let navigationController = BaseNavigationController(rootViewController: settingVC)
                navigationController.tabBarItem.title = "Setting"
                navigationController.tabBarItem.image = UIImage(systemName: "gear")
                viewControllers.append(navigationController)
            }
        }
        
        return viewControllers
    }
    
    func setTabbarSelected(_ type: TabbarType) {
        self.tabbarType = type
    }
}
