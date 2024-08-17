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
    
    // MARK: Life cycle's
    override func loadView() {
        super.loadView()
        
        overrideUserInterfaceStyle = AppSetting.isDarkMode ? .dark : .light
        
        let controllers = listViewController()
        setViewControllers(controllers, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.clipsToBounds = true
        tabBar.barTintColor = .appColor(.background)
        tabBar.tintColor = .appColor(.primary)
        tabBar.unselectedItemTintColor = .appColor(.primary).withAlphaComponent(0.3)
//        tabBar.backgroundColor = .appColor(.background)
        tabBar.isTranslucent = true
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
                let wardrobeVC = TasksViewController()
                let navigationController = BaseNavigationController(rootViewController: wardrobeVC)
                navigationController.tabBarItem.title = "Tasks"
                navigationController.tabBarItem.image = UIImage(systemName: "calendar.badge.clock")
                viewControllers.append(navigationController)
            case .setting:
                let profileVC = SettingViewController()
                let navigationController = BaseNavigationController(rootViewController: profileVC)
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
