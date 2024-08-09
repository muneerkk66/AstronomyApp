//
//  MockPODService.swift
//  AstronomyAppTests
//
//  Created by Muneer K K on 09/08/2024.
//

@testable import AstronomyApp
import Combine
import Foundation

// Mock class to replace the actual implementation of PODService
final class MockPODService: PODService {
    private let result: Result<PODResponse, AppError>

    private init(result: Result<PODResponse, AppError>) {
        self.result = result
    }

    func fetchMediaData(date: Date) -> AnyPublisher<PODResponse, AppError> {
        switch result {
        case let .success(response):
            return Just(response)
                .setFailureType(to: AppError.self)
                .eraseToAnyPublisher()

        case let .failure(error):
            return Fail(error: error)
                .eraseToAnyPublisher()
        }
    }
}

extension MockPODService {
    static func success(with response: PODResponse) -> MockPODService {
        return MockPODService(result: .success(response))
    }

    static func failure(with error: AppError) -> MockPODService {
        return MockPODService(result: .failure(error))
    }
}
