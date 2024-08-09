//
//  AstronomyAppUITests.swift
//  AstronomyAppUITests
//
//  Created by Muneer K K on 07/08/2024.
//

import XCTest

final class AstronomyAppUITests: XCTestCase {
    var app: XCUIApplication!
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testLoadAPODView() throws {
        let existsPredicate = NSPredicate(format: "exists == true")
        let imageView = app.images["\(AppConstants.ViewIdentifier.podView).\(AppConstants.ViewIdentifier.image)"]

        // Wait for the imageView to appear
        expectation(for: existsPredicate, evaluatedWith: imageView, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(imageView.exists, "The imageView should exist after the view has loaded.")

        let title = app.staticTexts["\(AppConstants.ViewIdentifier.podView).\(AppConstants.ViewIdentifier.title)"]
        XCTAssertTrue(title.exists, "The title should exist after the view has loaded.")

        let description = app.staticTexts["\(AppConstants.ViewIdentifier.podView).\(AppConstants.ViewIdentifier.description)"]
        XCTAssertTrue(description.exists, "The description should exist after the view has loaded.")

        let dateLabel = app.staticTexts["\(AppConstants.ViewIdentifier.podView).\(AppConstants.ViewIdentifier.date)"]
        XCTAssertTrue(dateLabel.exists, "The date should exist after the view has loaded.")
    }

    func testDatePicker() throws {
        let existsPredicate = NSPredicate(format: "exists == true")
        let calendarButton = app.buttons["\(AppConstants.ViewIdentifier.podView).\(AppConstants.ViewIdentifier.calendar)"]

        // Wait for the calendar button to appear
        expectation(for: existsPredicate, evaluatedWith: calendarButton, handler: nil)
        waitForExpectations(timeout: 10, handler: nil)
        XCTAssertTrue(calendarButton.exists, "The calendar button should exist after the view has loaded.")

        calendarButton.tap()

        let datePicker = app.datePickers[AppConstants.ViewIdentifier.datePicker]

        XCTAssertTrue(datePicker.exists, "Date picker should appear when the calendar button is tapped.")
        let monthPickerWheel = datePicker.pickerWheels.element(boundBy: 0)
        let dayPickerWheel = datePicker.pickerWheels.element(boundBy: 1)
        let yearPickerWheel = datePicker.pickerWheels.element(boundBy: 2)

        // Adjust to the desired date
        monthPickerWheel.adjust(toPickerWheelValue: "July")
        dayPickerWheel.adjust(toPickerWheelValue: "4")
        yearPickerWheel.adjust(toPickerWheelValue: "2024")

        XCTAssertEqual(monthPickerWheel.value as? String, "July")
        XCTAssertEqual(dayPickerWheel.value as? String, "4")
        XCTAssertEqual(yearPickerWheel.value as? String, "2024")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
