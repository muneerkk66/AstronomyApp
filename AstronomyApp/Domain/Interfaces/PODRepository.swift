//
//  APODRepository.swift
//  AstronomyApp
//
//  Created by Muneer K K on 07/08/2024.
//

import Combine
import Foundation

protocol PODRepository {
    func loadPODData(date: Date) -> AnyPublisher<PODData, APIError>
}
