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

    func loadImageData(date: Date) -> AnyPublisher<PODResponse, APIError> {
        return podService
            .fetchImageData(date: date)
    }
}
