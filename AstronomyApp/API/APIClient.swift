//
//  APIClient.swift
//  AstronomyApp
//
//  Created by Muneer K K on 07/08/2024.
//

import Foundation
import Combine

protocol APIClient {
    @discardableResult
    func request<Response: Decodable>(_ request: APIRequest<Response>) -> AnyPublisher<Response, AppError>
}
