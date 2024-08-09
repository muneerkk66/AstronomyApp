//
//  FetchPODUseCase.swift
//  AstronomyApp
//
//  Created by Muneer K K on 07/08/2024.
//

import Combine
import Foundation

protocol FetchPODUseCase {
    func execute(date: Date) -> AnyPublisher<PODData, AppError>
}

final class FetchPODUseCaseLive: FetchPODUseCase {
    private var podRepository: PODRepository

    init(podRepository: PODRepository) {
        self.podRepository = podRepository
    }

    func execute(date: Date) -> AnyPublisher<PODData, AppError> {
        return podRepository.loadPODData(date: date)
    }
}
