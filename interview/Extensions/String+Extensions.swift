//
//  String+Extensions.swift
//  interview
//
//  Created by Anh Kiet on 17/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import Foundation

extension String {
    
    private func _localized() -> String {
        let bundle: Bundle = .main
        
        if let path = Bundle.main.path(forResource: Localize.shared.currentLanguage().rawValue, ofType: "lproj"),
            let bundle = Bundle(path: path) {
            return bundle.localizedString(forKey: self, value: nil, table: nil)
        } else if let path = bundle.path(forResource: "Base", ofType: "lproj"),
            let bundle = Bundle(path: path) {
            return bundle.localizedString(forKey: self, value: nil, table: nil)
        }
        
        return self
    }
    
    func localized() -> String {
        return _localized()
    }
    
    func localized(_ arguments: CVarArg...) -> String {
        return String(format: _localized(), arguments: arguments)
    }
}
