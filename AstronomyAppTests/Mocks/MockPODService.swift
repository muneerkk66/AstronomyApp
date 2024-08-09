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
    private let result: Result<PODResponse, APIError>

    private init(result: Result<PODResponse, APIError>) {
        self.result = result
    }

    func fetchImageData(date: Date) -> AnyPublisher<PODResponse, APIError> {
        switch result {
        case let .success(response):
            return Just(response)
                .setFailureType(to: APIError.self)
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

    static func failure(with error: APIError) -> MockPODService {
        return MockPODService(result: .failure(error))
    }
}
