//
//  MockResponse.swift
//  AstronomyApp
//
//  Created by Muneer K K on 09/08/2024.
//

@testable import AstronomyApp
import Foundation
struct MockData {
    static let podResponse = PODResponse(date: "2024-10-23", explanation: "test", hdUrl: "https://url.com", mediaType: "image", serviceVersion: "1.0", title: "test", url: "https://url.com")

    static let podData = PODData(title: "test", description: "test", type: PODType.image, url: "https://url.com", date: "2024-10-23")
    static let podHistory = MockPODHistory(
        date: "2024-08-09",
        explanation: "A sample explanation for testing.",
        title: "Sample Test Title",
        url: "https://example.com/test-image.jpg",
        mediaType: "image",
        updatedAt: Date.now
    )
}
