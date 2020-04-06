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

extension NSEvent {

    /// Returns `true` if the event is `.rightMouseUp` or equivalent.
    /// Returns `false` otherwise.
    public var isRightClickUp: Bool {
        let rightClick = (self.type == .rightMouseUp)
        let controlClick = self.modifierFlags.contains(.control)
        return rightClick || controlClick
    }
}

extension NSApplication {

    /// Returns `true` if the application's current event is `.rightMouseUp` or equivalent.
    /// Returns `false` otherwise.
    public var isCurrentEventRightClickUp: Bool {
        if let current = self.currentEvent {
            return current.isRightClickUp
        }
        return false
    }
}

extension NSMenuItem {

    /// A convenience init for `NSMenuItem`.
    /// - Parameters:
    ///   - title: The title of the menu item.
    ///   - target: The target to be associated with the menu item.
    ///   - action: The action selector to be associated with the menu item.
    ///   - keyEquivalent: A string representing a keyboard key to be used as the key equivalent.
    ///   - isEnabled: A Boolean value that indicates whether the menu item is enabled.
    public convenience init(title: String,
                            target: AnyObject? = nil,
                            action: Selector? = nil,
                            keyEquivalent: String = "",
                            isEnabled: Bool = true) {
        self.init(title: title, action: action, keyEquivalent: keyEquivalent)
        self.target = target
        self.isEnabled = isEnabled
    }
}
