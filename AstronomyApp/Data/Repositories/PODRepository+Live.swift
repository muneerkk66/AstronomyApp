//
//  PODRepository+Live.swift
//  AstronomyApp
//
//  Created by Muneer K K on 07/08/2024.
//

import Combine
import Foundation

final class PODRepositoryLive: PODRepository {
    private let podService: PODService
    private let localDataSource: PODLocalDataSource

    init(podService: PODService, localDataSource: PODLocalDataSource) {
        self.podService = podService
        self.localDataSource = localDataSource
    }

    func loadPODData(date: Date) -> AnyPublisher<PODData, APIError> {
        guard NetworkMonitor.shared.isConnected else {
            return fetchHistoryData()
        }

        return podService.fetchImageData(date: date)
            .map {
                [weak self] result -> PODData in
                guard let self = self else {
                    return result.toPodModel()
                }
                Task {
                    await self.localDataSource.saveHistory(result)
                }
                return result.toPodModel()
            }
            .catch { [weak self] _ -> AnyPublisher<PODData, APIError> in
                guard let self = self else {
                    return Fail(error: APIError.connectionError).eraseToAnyPublisher()
                }
                return fetchHistoryData()
            }
            .eraseToAnyPublisher()
    }

    func fetchHistoryData() -> AnyPublisher<PODData, APIError> {
        return Future { promise in
            Task {
                do {
                    let results = try await self.localDataSource.fetchHistory()
                    guard let results else {
                        return promise(.failure(APIError.applicationError))
                    }
                    promise(.success(results.toPodModel()))
                } catch {
                    promise(.failure(APIError.applicationError))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
