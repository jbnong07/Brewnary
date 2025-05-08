//
//  Date+Format.swift
//  Brewnary
//
//  Created by 박진홍 on 5/8/25.
//

import Foundation

extension Date {
    func toIso8601Date() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }
}
