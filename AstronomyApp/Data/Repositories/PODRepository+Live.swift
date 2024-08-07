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

    init(podService: PODService) {
        self.podService = podService
    }

    func loadPODData(date: Date) -> AnyPublisher<PODData, APIError> {
		guard NetworkMonitor.shared.isConnected else { return Fail(error: APIError.connectionError).eraseToAnyPublisher()}

        return podService.fetchImageData(date: date)
            .map { $0.toPodModel() }
            .eraseToAnyPublisher()
    }
}
