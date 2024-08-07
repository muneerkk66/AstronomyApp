//
//  PODType.swift
//  AstronomyApp
//
//  Created by Muneer K K on 07/08/2024.
//

import Foundation

enum PODType {
    case image
    case video

    static func from(mediaType: String) -> PODType {
        switch mediaType {
        case "image":
            return .image
        case "video":
            return .video
        default:
            return .image
        }
    }
}
