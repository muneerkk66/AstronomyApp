//
//  APIEnvironment.swift
//  AstronomyApp
//
//  Created by Muneer K K on 07/08/2024.
//

import Foundation

protocol APIEnvironment {
    var environment: AppEnvironment { get }
    func set(to environment: AppEnvironment)
}
