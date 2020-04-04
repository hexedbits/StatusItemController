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
    public var isRightClickUp: Bool {
        let rightClick = (self.type == .rightMouseUp)
        let controlClick = self.modifierFlags.contains(.control)
        return rightClick || controlClick
    }
}

extension NSApplication {
    public var isCurrentEventRightClickUp: Bool {
        if let current = self.currentEvent {
            return current.isRightClickUp
        }
        return false
    }
}

extension NSMenuItem {
    public convenience init(title: String,
                            target: AnyObject,
                            action: Selector? = nil,
                            keyEquivalent: String = "",
                            isEnabled: Bool = true) {
        self.init(title: title, action: action, keyEquivalent: keyEquivalent)
        self.target = target
        self.isEnabled = isEnabled
    }
}
