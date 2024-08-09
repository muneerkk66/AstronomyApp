//
//  MockPODLocalDataSource.swift
//  AstronomyAppTests
//
//  Created by Muneer K K on 09/08/2024.
//

@testable import AstronomyApp
import Foundation

final class MockPODLocalDataSource: PODLocalDataSource {
    var mockFetchHistoryResult: Result<PODHistory?, Error>?
    var savedHistoryObjects: [PODResponse] = []

    func fetchHistory() async throws -> PODHistory? {
        if let result = mockFetchHistoryResult {
            switch result {
            case let .success(history):
                return history
            case let .failure(error):
                throw error
            }
        }
        return nil
    }

    func saveHistory(_ object: PODResponse) async {
        savedHistoryObjects.append(object)
    }
}

extension MockPODLocalDataSource {
    static func withFetchSuccess(_ history: PODHistory?) -> MockPODLocalDataSource {
        let mock = MockPODLocalDataSource()
        mock.mockFetchHistoryResult = .success(history)
        return mock
    }

    static func withFetchFailure(_ error: Error) -> MockPODLocalDataSource {
        let mock = MockPODLocalDataSource()
        mock.mockFetchHistoryResult = .failure(error)
        return mock
    }
}
