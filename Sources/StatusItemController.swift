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

/// Controller for an `NSStatusItem`. Designed to be subclassed.
/// - Warning: You must subclass this controller.
@MainActor
open class StatusItemController: NSObject, NSMenuDelegate {

    // MARK: Properties

    /// The status item.
    public let statusItem: NSStatusItem

    // MARK: Init

    /// Creates a new `StatusItemController`.
    /// - Parameters:
    ///   - image: An image for the status item button.
    ///   - length: The length of the status item.
    public init(image: NSImage, length: CGFloat = NSStatusItem.squareLength) {
        self.statusItem = NSStatusBar.system.statusItem(withLength: length)
        super.init()
        self.statusItem.button?.toolTip = Bundle.main.infoDictionary?["CFBundleName"] as? String
        self.statusItem.button?.image = image
        (self.statusItem.button?.cell as? NSButtonCell)?.highlightsBy = [NSCell.StyleMask.init(rawValue: 0)]
        self.statusItem.button?.target = self
        self.statusItem.button?.action = #selector(_didClickStatusItem(_:))
        self.statusItem.button?.sendAction(on: [.leftMouseDown, .rightMouseUp])
    }

    /// :nodoc:
    deinit {
        NSStatusBar.system.removeStatusItem(self.statusItem)
    }

    // MARK: Open methods

    /// Constructs an `NSMenu` to display for the status item.
    /// - Returns: A menu object.
    /// - Warning: You must override this method.
    open func buildMenu() -> NSMenu { NSMenu() }

    /// The action to be executed on the `.leftMouseDown` event.
    /// - Warning: You must override this method.
    open func leftClickAction() { }

    /// The action to be executed on `.rightMouseUp` event.
    /// - Warning: You must override this method.
    open func rightClickAction() { }

    // MARK: Actions

    /// Opens the status item menu.
    /// You may wish to call this from `leftClickAction()` or `rightClickAction()`.
    public func openMenu() {
        // Yes, this is deprecated, however there seems to be a bug in AppKit.
        // Without using this method, the menu does not popup immediately,
        // and you have to right click a second time.
        self.statusItem.popUpMenu(self._configureMenu(hidden: false)!)
    }

    /// Hides the status item menu.
    public func hideMenu() {
        self._configureMenu(hidden: true)
    }

    /// Quits the application.
    /// You may wish to create an `NSMenuItem` that calls this method.
    @objc
    public func quit() {
        NSApp.terminate(self)
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

    /// :nodoc:
    public func menuDidClose(_ menu: NSMenu) {
        self._configureMenu(hidden: true)
    }
}
