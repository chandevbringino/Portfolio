//
//  RandomUsersAppUITests.swift
//  RandomUsersAppUITests
//
//  Created by Christian Bringino on 8/3/24.
//

import XCTest

final class RandomUsersAppUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    func testExample() throws {
        let app = XCUIApplication()
        app.launch()

        let searchBar = app.searchFields["Search..."]
        XCTAssertTrue(searchBar.exists)
        
        searchBar.tap()
        searchBar.typeText("Erica")
        
        let myTable = app.tables.matching(identifier: "myTableview")
        XCTAssertTrue(myTable.firstMatch.exists)
        
        let cell = myTable.cells.element(matching: .cell, identifier: "myCell_0")
        XCTAssertTrue(cell.firstMatch.exists)
        
        cell.tap()
        
        let navBackButton = app.navigationBars.buttons.element(boundBy: 0)
        navBackButton.tap()
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
