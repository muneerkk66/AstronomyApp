//
//  PODModel+DomainMapper.swift
//  AstronomyApp
//
//  Created by Muneer K K on 07/08/2024.
//

import Foundation
extension PODResponse {
    func toPodModel() -> PODData {
        let podType = PODType.from(mediaType: mediaType)
        return PODData(
            title: title,
            description: explanation,
            type: podType,
            url: url,
            date: date
        )
    }
}

extension PODHistory {
	func toPodModel() -> PODData {
		let podType = PODType.from(mediaType: mediaType.orEmpty)
		return PODData(
			title: title.orEmpty,
			description: explanation.orEmpty,
			type: podType,
			url: url.orEmpty,
			date: date.orEmpty
		)
	}
}

