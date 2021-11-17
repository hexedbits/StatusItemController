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
import Foundation
import StatusItemController

class ExampleAppStatusController: StatusItemController {

    init() {
        super.init(image: NSImage(named: "StatusIcon")!)
    }

    // MARK: Overrides

    override func buildMenu() -> NSMenu {
        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "Option 1"))
        menu.addItem(NSMenuItem(title: "Option 2"))
        menu.addItem(NSMenuItem(title: "Option 3"))
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Version 1.0", isEnabled: false))
        menu.addItem(NSMenuItem(title: "Quit",
                                target: self,
                                action: #selector(quit)))
        return menu
    }

    override func leftClickAction() {
        self.openMenu()
    }

    override func rightClickAction() {
        self.openMenu()
    }
}
