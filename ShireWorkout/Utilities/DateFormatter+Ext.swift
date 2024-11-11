//
//  DateFormatter+Ext.swift
//  ShireWorkout
//
//  Created by Chris Shireman on 9/8/24.
//

import Foundation

extension DateFormatter {
    static var sqlDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd"
        
        return formatter
    }
}
