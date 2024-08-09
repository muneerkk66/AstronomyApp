//
//  APIError.swift
//  AstronomyApp
//
//  Created by Muneer K K on 07/08/2024.
//

import Foundation

//TODO: (MUNEER) Create a new error type for API-related errors and separate out other errors.
enum AppError: LocalizedError {
    case connectionError
    case serverError(Error)
    case applicationError

    var message: String {
        switch self {
        case .connectionError:
            return NSLocalizedString("apiError.connection", comment: "API connection error")
        case .serverError, .applicationError:
            return NSLocalizedString("apiError.application", comment: "API common error")
        }
    }
}

extension Error {
    var applicationError: AppError {
        if let error = self as? URLError {
            return error.code == .notConnectedToInternet
                ? .connectionError
                : .serverError(error)
        } else {
            return .applicationError
        }
    }
}
