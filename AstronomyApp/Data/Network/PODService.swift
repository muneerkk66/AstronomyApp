//
//  APODService.swift
//  AstronomyApp
//
//  Created by Muneer K K on 07/08/2024.
//

import Combine
import Foundation

protocol PODService {
    @discardableResult
    func fetchMediaData(date: Date
    ) -> AnyPublisher<PODResponse, AppError>
}
