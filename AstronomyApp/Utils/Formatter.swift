//
//  Formatter.swift
//  AstronomyApp
//
//  Created by Muneer K K on 07/08/2024.
//

import Foundation

private var dateOnlyFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter
}()

private var displayDateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMMM d, yyyy"
    return formatter
}()

extension Date {
    var dateOnly: String {
        return dateOnlyFormatter.string(from: self)
    }
}

extension String {
    var displayDate: String {
        if let date = dateOnlyFormatter.date(from: self) {
            return displayDateFormatter.string(from: date)
        }
        return self
    }
}
