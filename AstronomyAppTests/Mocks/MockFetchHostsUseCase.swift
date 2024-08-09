//
//  MockFetchPODDataUseCase.swift
//  AstronomyApp
//
//  Created by Muneer K K on 09/08/2024.
//

@testable import AstronomyApp
import Combine
import Foundation

class MockFetchPODUseCase: FetchPODUseCase {
    let result: Result<PODData, APIError>

    init(result: Result<PODData, APIError>) {
        self.result = result
    }

    func execute(date: Date) -> AnyPublisher<PODData, APIError> {
        return result.publisher.eraseToAnyPublisher()
    }
}

extension MockFetchPODUseCase {
    static func success(with result: PODResponse) -> MockFetchPODUseCase {
        return MockFetchPODUseCase(result: .success(result.toPodModel()))
    }

    static func failure(error: APIError) -> MockFetchPODUseCase {
        return MockFetchPODUseCase(result: .failure(error))
    }
}
