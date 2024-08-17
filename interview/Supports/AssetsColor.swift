//
//  AssetsColor.swift
//  interview
//
//  Created by Anh Kiet on 17/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import UIKit

enum AssetsColor: String {
    case primary = "PrimaryColor"
    case text = "TextColor"
    case subtext = "SubtextColor"
    case background = "BackgroundColor"
    case container = "ContainerColor"
}

extension UIColor {
    
    static func appColor(_ name: AssetsColor) -> UIColor {
        return UIColor(named: name.rawValue) ?? .white
    }
}
