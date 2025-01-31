//
//  AppEnvironment.swift
//  AstronomyApp
//
//  Created by Muneer K K on 07/08/2024.
//

import Foundation

// MARK: This file facilitates the management of API endpoints and their associated keys. For enhanced security, Arakana encryption is utilised for handling API keys.

enum AppEnvironment: String, Codable, CaseIterable {
    case development = "dev"
    case qa
    case production = "prod"
}

// TODO: (MUNEER) Update environment variables based on the server.
extension AppEnvironment {
    var baseURL: URL {
        switch self {
        case .development:
            return URL(string: "https://api.nasa.gov")!
        case .qa:
            return URL(string: "https://api.nasa.gov")!
        case .production:
            return URL(string: "https://api.nasa.gov")!
        }
    }

	// TODO: (MUNEER) Store your keys and secrets away from your source code ,use Arkana keys : https://github.com/rogerluan/arkana
	var apiKey: String {
		switch self {
		case .development:
			return "aTAy3b7YMPVC947YxKYPd9DsD58MxZ8wuvHz4vRQ"
		case .qa:
			return "aTAy3b7YMPVC947YxKYPd9DsD58MxZ8wuvHz4vRQ"
		case .production:
			return "aTAy3b7YMPVC947YxKYPd9DsD58MxZ8wuvHz4vRQ"
		}
	}
}
