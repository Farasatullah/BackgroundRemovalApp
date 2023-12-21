//
//  StringExtensions.swift
//  BackgroundRemovalApp
//
//  Created by Farasat_Niazi on 12/12/2023.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    func localized(arguments: CVarArg...) -> String {
        return String(format: self.localized, arguments: arguments)
    }
}
