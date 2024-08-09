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
    let result: Result<PODData, AppError>

    init(result: Result<PODData, AppError>) {
        self.result = result
    }

    func execute(date: Date) -> AnyPublisher<PODData, AppError> {
        return result.publisher.eraseToAnyPublisher()
    }
}

extension MockFetchPODUseCase {
    static func success(with result: PODResponse) -> MockFetchPODUseCase {
        return MockFetchPODUseCase(result: .success(result.toPodModel()))
    }

    static func failure(error: AppError) -> MockFetchPODUseCase {
        return MockFetchPODUseCase(result: .failure(error))
    }
}
