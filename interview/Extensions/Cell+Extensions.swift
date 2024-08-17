//
//  Cell+Extensions.swift
//  interview
//
//  Created by Anh Kiet on 17/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    class var identifier: String {
        return NSStringFromClass(self)
    }
}

extension UICollectionViewCell {
    
    class var identifier: String {
        return NSStringFromClass(self)
    }
}
