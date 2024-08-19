//
//  UIColor+Extensions.swift
//  interview
//
//  Created by Anh Kiet on 17/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import UIKit

extension UIColor {
    
    static let homeWidget: UIColor = .init(red: 200/255, green: 163/255, blue: 213/255, alpha: 1)
    
    struct Status {
        struct Background {
            static let done: UIColor = .init(red: 17/255, green: 135/255, blue: 71/255, alpha: 1)
            static let inReview: UIColor = .init(red: 123/255, green: 109/255, blue: 235/255, alpha: 1)
            static let inProgress: UIColor = .init(red: 31/255, green: 146/255, blue: 221/255, alpha: 1)
            static let todo: UIColor = .init(red: 232/255, green: 234/255, blue: 237/255, alpha: 1)
        }
        
        struct TexColor {
            static let done: UIColor = .white
            static let inReview: UIColor = .white
            static let inProgress: UIColor = .white
            static let todo: UIColor = .darkGray
        }
    }
    
    struct Green {
        static let g1: UIColor = .init(red: 35/255, green: 171/255, blue: 108/255, alpha: 1)
        static let g2: UIColor = .init(red: 103/255, green: 1, blue: 100/255, alpha: 1)
    }
    
    struct Yellow {
        static let y1: UIColor = .init(red: 1, green: 214/255, blue: 0, alpha: 1)
        static let y2: UIColor = .init(red: 1, green: 214/255, blue: 0, alpha: 1)
    }
    
    struct Red {
        static let r1: UIColor = .init(red: 255/255, green: 53/255, blue: 78/255, alpha: 1)
        static let r6: UIColor = .init(red: 245/255, green: 34/255, blue: 45/255, alpha: 1)
    }
}
