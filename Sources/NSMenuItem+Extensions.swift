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

extension NSMenuItem {
    /// A convenience init for `NSMenuItem`.
    /// - Parameters:
    ///   - title: The title of the menu item.
    ///   - image: The image for the menu item.
    ///   - target: The target to be associated with the menu item.
    ///   - action: The action selector to be associated with the menu item.
    ///   - keyEquivalent: A string representing a keyboard key to be used as the key equivalent.
    ///   - isEnabled: A Boolean value that indicates whether the menu item is enabled.
    public convenience init(title: String,
                            image: NSImage? = nil,
                            target: AnyObject? = nil,
                            action: Selector? = nil,
                            keyEquivalent: String = "",
                            isEnabled: Bool = true) {
        self.init(title: title, action: action, keyEquivalent: keyEquivalent)
        self.image = image
        self.target = target
        self.isEnabled = isEnabled
    }
}
