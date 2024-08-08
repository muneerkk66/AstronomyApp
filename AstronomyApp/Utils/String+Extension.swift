//
//  String+Extension.swift
//  AstronomyApp
//
//  Created by Muneer K K on 08/08/2024.
//

import Foundation
import Foundation

extension Optional where Wrapped: StringProtocol {
	var orEmpty: String {
		switch self {
		case .some(let value):
			return String(value)
		case .none:
			return ""
		}
	}
}
