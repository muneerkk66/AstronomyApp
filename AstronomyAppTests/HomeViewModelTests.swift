//
//  HomeViewModelTests.swift
//
//  Created by Muneer K K on 09/08/2024.
//

import Foundation

@testable import AstronomyApp
import XCTest

@MainActor
class HomeViewModelTests: XCTestCase {
    var viewModel: HomeViewModel!
    var mockFetchPODUseCase: MockFetchPODUseCase!

    override func setUp() {
        super.setUp()

        viewModel = HomeViewModel(coordinator: MockHomeCoordinator(), fetchPODUseCase: MockFetchPODUseCase.success(with: MockData.podResponse))
    }

    override func tearDown() {
        viewModel = nil
        mockFetchPODUseCase = nil
        super.tearDown()
    }

    func testInitialState() {
        XCTAssertEqual(viewModel.viewState, .idle)
        XCTAssertNil(viewModel.podData)
    }

    func testRetry() throws {
        let exp = XCTestExpectation(description: "TestRetryPodData")
        XCTAssertNil(viewModel.podData)
        viewModel.handle(.retryLoadPODData)
        let result = XCTWaiter.wait(for: [exp], timeout: 0.5)
        if result == XCTWaiter.Result.timedOut {
            let podData = try XCTUnwrap(viewModel.podData)
            XCTAssertNotNil(podData)

        } else {
            XCTFail("Test Failed: TestRetryPodData")
        }
    }

    func testFetchPODDataSuccess() throws {
        let exp = XCTestExpectation(description: "TestFetchPODDataSuccess")
        viewModel.fetchPodData(date: Date.now)
        let result = XCTWaiter.wait(for: [exp], timeout: 0.5)
        if result == XCTWaiter.Result.timedOut {
            let podData = try XCTUnwrap(viewModel.podData)
            XCTAssertNotNil(podData)

        } else {
            XCTFail("Test Failed: Fetch PODData Success")
        }
    }

    func testFetchPODDataSuccessWithVideo() throws {
        viewModel = HomeViewModel(coordinator: MockHomeCoordinator(), fetchPODUseCase: MockFetchPODUseCase.success(with: MockData.podResponse.createResponse(mediaType: "video")))
        let exp = XCTestExpectation(description: "TestFetchPODDataSuccessWithVideo")
        viewModel.fetchPodData(date: Date.now)
        let result = XCTWaiter.wait(for: [exp], timeout: 0.5)
        if result == XCTWaiter.Result.timedOut {
            let podData = try XCTUnwrap(viewModel.podData)
            XCTAssertNotNil(podData)

        } else {
            XCTFail("Test Failed: Fetch PODDataWithVideo Success")
        }
    }

    func testFetchPODDataFailure() throws {
        let exp = XCTestExpectation(description: "TestFetchPODDataFailure")
        viewModel = HomeViewModel(coordinator: MockHomeCoordinator(), fetchPODUseCase: MockFetchPODUseCase.failure(error: APIError.applicationError))

        viewModel.fetchPodData(date: Date.now)
        let result = XCTWaiter.wait(for: [exp], timeout: 0.5)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertNil(viewModel.podData)
        } else {
            XCTFail("Test Failed: FetchPODData Failure")
        }
    }
}
