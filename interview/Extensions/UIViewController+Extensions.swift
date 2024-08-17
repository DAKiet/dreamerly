//
//  UIViewController+Extensions.swift
//  interview
//
//  Created by Anh Kiet on 17/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import UIKit

extension UIViewController {
    
    var identifier: String {
        return String(describing: type(of: self))
    }
    
    var safeAreaInsets: UIEdgeInsets {
        let window = UIApplication.shared.connectedScenes.compactMap {
            return ($0 as? UIWindowScene)?.windows.filter { $0.isKeyWindow }.first
        }.first
        
        return window?.safeAreaInsets ?? view.safeAreaInsets
    }
    
    var statusBarHeight: CGFloat {
        let windowScene = UIApplication.shared.connectedScenes.compactMap {
            return ($0 as? UIWindowScene)
        }.first
        
        return windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    }
    
    var navigationHeight: CGFloat {
        return 44
    }
}
