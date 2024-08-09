//
//  PODServiceTests.swift
//  AstronomyAppTests
//
//  Created by Muneer K K on 09/08/2024.
//

@testable import AstronomyApp
import Foundation
import XCTest

final class PODServiceTests: XCTestCase {
    var model: PODServiceLive!
    override func setUpWithError() throws {
        let client = MockAPIClient.success(with: MockData.podResponse)
        model = PODServiceLive(apiClient: client)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchPodData() throws {
        let result = try awaitPublisher(model.fetchMediaData(date: Date()))
        XCTAssertTrue(try XCTUnwrap(result.title.count) > 0)
        XCTAssertNotNil(try XCTUnwrap(result.explanation.count) > 0)
        XCTAssertNotNil(try XCTUnwrap(result.url))

        let mediaType = try XCTUnwrap(result.mediaType)
        XCTAssertEqual(PODType.from(mediaType: mediaType), PODType.image)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
