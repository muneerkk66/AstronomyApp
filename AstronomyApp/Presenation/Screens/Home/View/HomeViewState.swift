//
//  HomeViewState.swift
//  AstronomyApp
//
//  Created by Muneer K K on 08/08/2024.
//

import Foundation

enum HomeViewEvent {
	case idle
    case retryLoadPODData
    case loadPODData
}

enum HomeViewState: Comparable {
    case idle
    case isLoading
    case finished
    case error(String)
}
