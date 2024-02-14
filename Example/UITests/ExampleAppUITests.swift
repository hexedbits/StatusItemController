//
//  Created by Jesse Squires
//  https://www.jessesquires.com
//
//  Documentation
//  https://hexedbits.github.io/StatusItemController
//
//  GitHub
//  https://github.com/hexedbits/StatusItemController
//
//  Copyright © 2020-present Jesse Squires, Hexed Bits
//  https://www.hexedbits.com
//

import StatusItemController
import XCTest

final class ExampleAppUITests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()

        self.continueAfterFailure = false
        XCUIApplication().launch()
    }

    func test_StatusItemController() {
        let app = XCUIApplication()
        let statusItem = app.children(matching: .menuBar).element(boundBy: 1).children(matching: .statusItem).element
        let menuBarsQuery = app.menuBars

        statusItem.click()
        XCTAssertTrue(menuBarsQuery.menuItems["Option 1"].waitForExistence(timeout: 3))
        XCTAssertTrue(menuBarsQuery.menuItems["Option 2"].exists)
        XCTAssertTrue(menuBarsQuery.menuItems["Option 3"].exists)
        XCTAssertTrue(menuBarsQuery.menuItems["Version 1.0"].exists)
        XCTAssertTrue(menuBarsQuery.menuItems["Quit"].exists)

        statusItem.click()
        statusItem.rightClick()
        XCTAssertTrue(menuBarsQuery.menuItems["Option 1"].waitForExistence(timeout: 3))
        XCTAssertTrue(menuBarsQuery.menuItems["Option 2"].exists)
        XCTAssertTrue(menuBarsQuery.menuItems["Option 3"].exists)
        XCTAssertTrue(menuBarsQuery.menuItems["Version 1.0"].exists)
        XCTAssertTrue(menuBarsQuery.menuItems["Quit"].exists)

        app.buttons[XCUIIdentifierCloseWindow].click()
    }
}
