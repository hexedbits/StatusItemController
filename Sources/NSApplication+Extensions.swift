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
