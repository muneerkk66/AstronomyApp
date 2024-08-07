//
//  AppFactory.swift
//  AstronomyApp
//
//  Created by Muneer K K on 07/08/2024.
//

import Foundation

final class AppFactory {
    private lazy var apiClient = APIClientLive(apiEnvironment: APIEnvironmentLive(currentEnvironment: AppEnvironment.development))

    private lazy var podService = PODServiceLive(apiClient: apiClient)

    private lazy var podRepository = PODRepositoryLive(podService: podService)
}

// MARK: - Home

extension AppFactory {
    func makeFetchPODDataUseCase() -> FetchPODUseCase {
        FetchPODUseCaseLive(podRepository: podRepository)
    }
}
