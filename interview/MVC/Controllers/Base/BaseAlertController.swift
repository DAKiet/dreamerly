//
//  BaseAlertController.swift
//  interview
//
//  Created by Anh Kiet on 17/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import UIKit

final class BaseAlertController: UIAlertController {
    
    // MARK: Life cycle's
    override func loadView() {
        super.loadView()
        
        overrideUserInterfaceStyle = AppSetting.isDarkMode ? .dark : .light
    }
}
