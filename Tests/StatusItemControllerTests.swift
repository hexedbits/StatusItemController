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

import AppKit
@testable import StatusItemController
import XCTest

final class StatusItemControllerTests: XCTestCase {

    let img = NSImage()

    func test_DefaultInitValues() throws {
        let controller = TestController(image: self.img)

        XCTAssertEqual(controller.statusItem.button?.image, self.img)
        XCTAssertEqual(controller.statusItem.length, NSStatusItem.squareLength)
    }

    func test_BuildMenuIsCalled_ForOpenMenu() {
        let controller = TestController(image: self.img)

        let expectation = self.expectation()
        controller.buildMenuExpectation = expectation

        controller.openMenu()
        self.wait(for: [expectation])
    }

    func test_BuildMenuIsNotCalled_ForHideMenu() {
        let controller = TestController(image: self.img)

        let expectation = self.expectation()
        expectation.isInverted = true
        controller.buildMenuExpectation = expectation

        controller.hideMenu()
        self.wait(for: [expectation])
    }

    func test_LeftClickAction_isCalled() {
        let controller = TestController(image: self.img)

        let leftExpectation = self.expectation()
        let rightExpectation = self.expectation()
        rightExpectation.isInverted = true
        controller.leftClickExpectation = leftExpectation
        controller.rightClickExpectation = rightExpectation

        controller.statusItem.button?.performClick(nil)
        self.wait(for: [leftExpectation, rightExpectation])
    }

// Sadly, no way to simulate a right click action
//
//    func test_RightClickAction_isCalled() {
//        let controller = TestController()
//
//        let leftExpectation = self.expectation()
//        leftExpectation.isInverted = true
//        let rightExpectation = self.expectation()
//        controller.leftClickExpectation = leftExpectation
//        controller.rightClickExpectation = rightExpectation
//
//        controller._didClickStatusItem(controller.statusItem)
//        self.wait(for: [leftExpectation, rightExpectation])
//    }
}

final class TestController: StatusItemController {

    var buildMenuExpectation: XCTestExpectation?
    var leftClickExpectation: XCTestExpectation?
    var rightClickExpectation: XCTestExpectation?

    override public func buildMenu() -> NSMenu {
        self.buildMenuExpectation!.fulfill()
        return NSMenu()
    }

    override public func leftClickAction() {
        self.leftClickExpectation!.fulfill()
    }

    override public func rightClickAction() {
        self.rightClickExpectation!.fulfill()
    }
}

extension XCTestCase {
    static let timeout = TimeInterval(10)

    func wait(for expectations: [XCTestExpectation]) {
        self.wait(for: expectations, timeout: Self.timeout)
    }

    func expectation(name: String = #function) -> XCTestExpectation {
        self.expectation(description: name)
    }
}
