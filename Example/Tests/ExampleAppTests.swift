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

@testable import ExampleApp
import StatusItemController
import XCTest

final class ExampleAppTests: XCTestCase {

    @MainActor
    func test_DefaultInitValues() throws {
        let controller = TestController()
        let img = NSImage(named: "StatusIcon")!

        XCTAssertEqual(controller.statusItem.button?.image, img)
        XCTAssertEqual(controller.statusItem.length, NSStatusItem.squareLength)
    }

    @MainActor
    func test_BuildMenuIsCalled_ForOpenMenu() {
        let controller = TestController()

        let expectation = self.expectation()
        controller.buildMenuExpectation = expectation

        controller.openMenu()
        self.wait(for: [expectation])
    }

    @MainActor
    func test_BuildMenuIsNotCalled_ForHideMenu() {
        let controller = TestController()

        let expectation = self.expectation()
        expectation.isInverted = true
        controller.buildMenuExpectation = expectation

        controller.hideMenu()
        self.wait(for: [expectation])
    }

    @MainActor
    func test_LeftClickAction_isCalled() {
        let controller = TestController()

        let leftExpectation = self.expectation()
        let rightExpectation = self.expectation()
        rightExpectation.isInverted = true
        controller.leftClickExpectation = leftExpectation
        controller.rightClickExpectation = rightExpectation

        controller.statusItem.button?.performClick(nil)
        self.wait(for: [leftExpectation, rightExpectation])
    }
}

final class TestController: ExampleAppStatusController {

    var buildMenuExpectation: XCTestExpectation?
    var leftClickExpectation: XCTestExpectation?
    var rightClickExpectation: XCTestExpectation?

    override func buildMenu() -> NSMenu {
        self.buildMenuExpectation?.fulfill()
        return super.buildMenu()
    }

    override func leftClickAction() {
        super.leftClickAction()

        self.leftClickExpectation!.fulfill()
    }

    override func rightClickAction() {
        super.rightClickAction()

        self.rightClickExpectation!.fulfill()
    }
}

extension XCTestCase {
    static let timeout = TimeInterval(3)

    func wait(for expectations: [XCTestExpectation]) {
        self.wait(for: expectations, timeout: Self.timeout)
    }

    func expectation(name: String = #function) -> XCTestExpectation {
        self.expectation(description: name)
    }
}
