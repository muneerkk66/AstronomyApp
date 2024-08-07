//
//  HostsRepository.swift
//  PingApp
//
//  Created by Muneer K K on 13/04/2024.
//

import Combine
import Foundation

final class PODRepositoryLive: PODRepository {
    private let podService: PODService

    init(podService: PODService) {
        self.podService = podService
    }

    func loadPODData(date: Date) -> AnyPublisher<PODData, APIError> {
        podService.fetchImageData(date: date)
            .map { $0.toPodModel() }
            .eraseToAnyPublisher()
    }
}
