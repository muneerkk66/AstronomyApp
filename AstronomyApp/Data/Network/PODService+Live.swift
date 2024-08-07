//
//  APODService+Live.swift
//  AstronomyApp
//
//  Created by Muneer K K on 07/08/2024.
//

import Combine
import Foundation

final class PODServiceLive {
    private var apiClient: APIClient

    enum Endpoint {
        case fetchImageData
        var path: String {
            switch self {
            case .fetchImageData:
                return "/planetary/apod/"
            }
        }
    }

    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
}

extension PODServiceLive: PODService {
    func fetchImageData(date: Date
    ) -> AnyPublisher<PODResponse, APIError> {
        let params = [AppConstants.APODQuery.date: date.dateOnly]

        let fetchRequest = APIRequest<PODResponse>(
            path: Self.Endpoint.fetchImageData.path,
            query: params,
            method: .get
        )
        return apiClient.request(fetchRequest)
    }
}
