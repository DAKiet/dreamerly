//
//  Helper.swift
//  interview
//
//  Created by Anh Kiet on 17/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import Foundation
import UIKit

class Helper {
    
    class func attributes(
        font: UIFont, textColor: UIColor, lineHeight: CGFloat = 16,
        textAlignment: NSTextAlignment = .left
    ) -> [NSAttributedString.Key: Any] {
        let baselineOffset = (lineHeight - font.lineHeight) / 4.0
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byTruncatingTail
        paragraphStyle.alignment = textAlignment
        paragraphStyle.maximumLineHeight = lineHeight
        paragraphStyle.minimumLineHeight = lineHeight
        
        return [
            .baselineOffset: baselineOffset,
            .paragraphStyle: paragraphStyle,
            .foregroundColor: textColor,
            .font: font
        ]
    }
}
