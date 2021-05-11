//
//  DateFormatters.swift
//  CommonCode
//
//  Created by Charles Eison on 5/11/21.
//

import Foundation

// EXAMPLE:
// Text("\(Date(), formatter: ShortDateFormatter())")
class ShortDateFormatter: DateFormatter {
    override init() {
        super.init()
        dateStyle = .short
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
