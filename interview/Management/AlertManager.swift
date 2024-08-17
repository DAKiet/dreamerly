//
//  AlertManager.swift
//  interview
//
//  Created by Anh Kiet on 17/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import UIKit

final class AlertManager {
    
    static weak var window: UIWindow? {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate,
              let window = delegate.window else { return nil }
        
        return window
    }
    
    class func alert(title: String, message: String) {
        guard let viewController = window?.rootViewController else { return }
        
        let alertController = BaseAlertController(
            title: title, message: message, preferredStyle: .alert
        )
        alertController.addAction(.init(title: "OK", style: .default, handler: nil))
        viewController.present(alertController, animated: true, completion: nil)
    }
}
