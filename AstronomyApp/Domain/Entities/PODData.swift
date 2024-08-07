//
//  PODData.swift
//  AstronomyApp
//
//  Created by Muneer K K on 07/08/2024.
//

import Foundation

struct PODData: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let type: PODType
    let url: String
    let date: String
}
