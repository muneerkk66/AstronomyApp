//
//  APODRepository.swift
//  AstronomyApp
//
//  Created by Muneer K K on 07/08/2024.
//

import Combine
import Foundation

protocol PODRepository {
    func loadImageData(date: Date) -> AnyPublisher<PODResponse, APIError>
}
