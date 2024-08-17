//
//  Navigator.swift
//  interview
//
//  Created by Anh Kiet on 17/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import UIKit

final class Navigator {
    
    static weak var window: UIWindow? {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate,
              let window = delegate.window else { return nil }
        
        return window
    }
    
    static weak var rootTabbarController: RootViewController? {
        guard let window = self.window,
              let tabbarController = window.rootViewController as? RootViewController else { return nil }
        
        return tabbarController
    }
    
    class func tabbarSelected(with type: TabbarType) {
        guard let tabbarController = rootTabbarController else { return }
        
        tabbarController.setTabbarSelected(type)
    }
    
    class func showRootViewController(at type: TabbarType = .home) {
        guard let window = self.window else { return }
        
        let rootTabbarController = RootViewController(at: type)
        window.rootViewController = rootTabbarController
        UIView.transition(with: window,
                          duration: 0.2,
                          options: .transitionFlipFromRight,
                          animations: nil,
                          completion: { _ in })
    }
}
