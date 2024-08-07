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


extension Date {
	var dateOnly: String {
		return dateOnlyFormatter.string(from: self)
	}
}
