//
//  MockAPIClient.swift
//  AstronomyApp
//
//  Created by Muneer K K on 09/08/2024.
//

@testable import AstronomyApp
import Combine
import Foundation
import Network

// Mock class to replace the actual implementation of APIClient
class MockAPIClient: APIClient {
    let result: Result<Data, AppError>

    init(result: Result<Data, AppError>) {
        self.result = result
    }

    func request<Response>(_ request: APIRequest<Response>) -> AnyPublisher<Response, AppError> {
        switch result {
        case let .success(data):
            do {
                // Decode data to the expected response type and return a publisher with the response
                let response = try JSONDecoder().decode(Response.self, from: data)
                return Just(response)
                    .setFailureType(to: AppError.self)
                    .eraseToAnyPublisher()
            } catch {
                // If decoding fails, return a publisher with an APIError
                return Fail(error: AppError.serverError(error))
                    .eraseToAnyPublisher()
            }
        case let .failure(error):
            // Return a publisher with an APIError
            return Fail(error: error)
                .eraseToAnyPublisher()
        }
    }
}

extension MockAPIClient {
    static func success<Response>(with response: Response) -> MockAPIClient where Response: Encodable {
        // Encode the given response into data to simulate a successful API response
        do {
            let data = try JSONEncoder().encode(response)
            return MockAPIClient(result: .success(data))
        } catch {
            fatalError("Failed to encode response: \(error)")
        }
    }

    static func failure(error: AppError) -> MockAPIClient {
        return MockAPIClient(result: .failure(error))
    }
}
