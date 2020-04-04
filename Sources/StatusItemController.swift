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

import Cocoa
import Foundation
import IOKit.pwr_mgt

/// Controller for an `NSStatusItem`. Designed to be subclassed.
open class StatusItemController: NSObject, NSMenuDelegate {

    // MARK: Properties

    public let statusItem: NSStatusItem

    // MARK: Init

    public init(image: NSImage, length: CGFloat = NSStatusItem.squareLength) {
        self.statusItem = NSStatusBar.system.statusItem(withLength: length)
        super.init()
        self.statusItem.button?.image = image
        (self.statusItem.button?.cell as? NSButtonCell)?.highlightsBy = [NSCell.StyleMask.init(rawValue: 0)]
        self.statusItem.button?.target = self
        self.statusItem.button?.action = #selector(_didClickStatusItem(_:))
        self.statusItem.button?.sendAction(on: [.leftMouseDown, .rightMouseUp])
    }

    deinit {
        NSStatusBar.system.removeStatusItem(self.statusItem)
    }

    // MARK: Open methods

    open func buildMenu() -> NSMenu { NSMenu() }

    open func leftClickAction() { }

    open func rightClickAction() { }

    // MARK: Actions

    public func openMenu() {
        // Yes, this is deprecated, however there seems to be a bug in AppKit.
        // Without using this method, the menu does not popup immediately,
        // and you have to right click a second time.
        self.statusItem.popUpMenu(self._configureMenu(hidden: false)!)
    }

    public func hideMenu() {
        self._configureMenu(hidden: true)
    }

    @objc
    public func quit() {
        NSApplication.shared.terminate(self)
    }

    // MARK: Private

    @discardableResult
    private func _configureMenu(hidden: Bool) -> NSMenu? {
        if hidden {
            self.statusItem.menu = nil
            return nil
        }
        let menu = self.buildMenu()
        menu.delegate = self
        self.statusItem.menu = menu
        return menu
    }

    @objc
    private func _didClickStatusItem(_ sender: NSStatusItem) {
        if NSApp.isCurrentEventRightClickUp {
            self.rightClickAction()
        } else {
            self.leftClickAction()
        }
    }

    // MARK: NSMenuDelegate

    public func menuDidClose(_ menu: NSMenu) {
        self._configureMenu(hidden: true)
    }
}
