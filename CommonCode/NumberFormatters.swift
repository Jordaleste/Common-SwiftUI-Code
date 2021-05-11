//
//  NumberFormatters.swift
//  CommonCode
//
//  Created by Charles Eison on 4/30/21.
//

import Foundation

extension NSNumber {
    /// Converts given NSNumber to localized currency in string format
    func localizedCurrency() -> String {
        let formattedNumber = NumberFormatter.localizedString(from: self, number: .currency)
        return formattedNumber
    }
}


extension Double {
    /// Converts given Double to localized currency in string format
    func localizedCurrency() -> String {
        let formattedNumber = NumberFormatter.localizedString(from: NSNumber(value: self), number: .currency)
        return formattedNumber
    }
}

/// Returns given date in .short notation
var dateFormatter: DateFormatter {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .short
    return dateFormatter
}
