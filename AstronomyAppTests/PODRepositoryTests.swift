//
//  PODRepositoryTests.swift
//  AstronomyAppTests
//
//  Created by Muneer K K on 09/08/2024.
//

@testable import AstronomyApp
import Combine
import XCTest

final class PODRepositoryTests: XCTestCase {
    var model: PODRepositoryLive!
    var mockPodLocalDataSource: MockPODLocalDataSource!

    override func setUpWithError() throws {
        mockPodLocalDataSource = MockPODLocalDataSource.withFetchSuccess(MockData.podHistory)
        model = PODRepositoryLive(podService: MockPODService.success(with: MockData.podResponse), localDataSource: mockPodLocalDataSource)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchRemotePODData() throws {
        let result = try awaitPublisher(model.loadPODData(date: Date.now))
        XCTAssertTrue(result.title.count > 1)
        XCTAssertTrue(result.description.count > 1)
        XCTAssertTrue(result.url.count > 1)
    }

    func testFetchLocalPODData() throws {
        model = PODRepositoryLive(podService: MockPODService.failure(with: AppError.applicationError), localDataSource: mockPodLocalDataSource)
        let result = try awaitPublisher(model.loadPODData(date: Date.now))
        XCTAssertEqual(result.title, MockData.podHistory.title)
        XCTAssertEqual(result.description, MockData.podHistory.explanation)
        XCTAssertEqual(result.url, MockData.podHistory.url)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
