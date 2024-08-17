//
//  Localize.swift
//  interview
//
//  Created by Anh Kiet on 17/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import Foundation
import UIKit

enum AppLanguage: String, CustomStringConvertible, CaseIterable {
    case vietnamese = "vi"
    case english = "en"
    
    var description: String {
        switch self {
        case .vietnamese:
            return "Tiếng Việt"
        case .english:
            return "English"
        }
    }
}

final class Localize: NSObject {
    
    static let shared = Localize()
    
    // MARK: Properties
    // App default language. English. If English is unavailable defaults to base localization.
    func currentLanguage() -> AppLanguage {
        if let currentLanguage = UserDefaults.standard.object(
            forKey: Key.UserDefault.currentLanguage.rawValue
        ) as? String {
            return .init(rawValue: currentLanguage) ?? defaultLanguage()
        }
        
        return defaultLanguage()
    }
    
    func availableLanguages(_ excludeBase: Bool = false) -> [String] {
        var availableLanguages = Bundle.main.localizations
        // If excludeBase = true, don't include "Base" in available languages
        
        if let indexOfBase = availableLanguages.firstIndex(of: "Base"), excludeBase == true {
            availableLanguages.remove(at: indexOfBase)
        }
        
        return availableLanguages
    }
    
    func setCurrentLanguage(_ language: AppLanguage) {
        let selectedLanguage = availableLanguages().contains(language.rawValue) ? language : defaultLanguage()
        
        if selectedLanguage != currentLanguage() {
            UserDefaults.standard.set(
                selectedLanguage.rawValue,
                forKey: Key.UserDefault.currentLanguage.rawValue
            )
        }
    }
    
    func switchLanguage() {
        if currentLanguage() == .english {
            setCurrentLanguage(.vietnamese)
        } else {
            setCurrentLanguage(.english)
        }
    }
    
    private func defaultLanguage() -> AppLanguage {
        guard let preferredLanguage = Bundle.main.preferredLocalizations.first else {
            return .english
        }
        
        let availableLanguages: [String] = self.availableLanguages()
        if availableLanguages.contains(preferredLanguage) {
            return AppLanguage(rawValue: preferredLanguage) ?? .english
        } else {
            return .english
        }
    }
    
    func resetCurrentLanguageToDefault() {
        setCurrentLanguage(self.defaultLanguage())
    }
}
