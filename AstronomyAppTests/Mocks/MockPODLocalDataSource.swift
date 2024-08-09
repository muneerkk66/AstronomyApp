//
//  MockPODLocalDataSource.swift
//  AstronomyAppTests
//
//  Created by Muneer K K on 09/08/2024.
//

@testable import AstronomyApp
import Foundation

struct MockPODLocalDataSource: PODLocalDataSource {
    func fetchHistory() async throws -> PODHistory? {
        return nil
    }

    func saveHistory(_ object: PODResponse) async {
    }
}
