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

    func loadPODData(date: Date) -> AnyPublisher<PODData, AppError> {
        guard NetworkMonitor.shared.isConnected else {
            return fetchHistoryData()
        }

        return podService.fetchMediaData(date: date)
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
            .catch { [weak self] _ -> AnyPublisher<PODData, AppError> in
                guard let self = self else {
                    return Fail(error: AppError.connectionError).eraseToAnyPublisher()
                }
				// If an error occurs, try to fetch historical data from local storage
                return fetchHistoryData()
            }
            .eraseToAnyPublisher()
    }

    func fetchHistoryData() -> AnyPublisher<PODData, AppError> {
        return Future { promise in
            Task {
                do {
                    let results = try await self.localDataSource.fetchHistory()
                    guard let results else {
                        return promise(.failure(AppError.applicationError))
                    }
                    promise(.success(results.toPodModel()))
                } catch {
                    promise(.failure(AppError.applicationError))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
