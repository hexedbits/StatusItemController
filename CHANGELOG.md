# CHANGELOG

The changelog for `StatusItemController`. Also see the [releases](https://github.com/hexedbits/StatusItemController/releases) on GitHub.

---

NEXT
----

- TBA

1.1.0
-----

This release closes the [1.1.0 milestone](https://github.com/hexedbits/StatusItemController/milestone/1?closed=1).

### Changes

- Upgraded to Swift 5.3 and Xcode 12

- Changed the `target` parameter in the `NSMenuItem` convenience initializer to be optional, with a default value of `nil`.

```
convenience init(title: String,
                 target: AnyObject? = nil,
                 action: Selector? = nil,
                 keyEquivalent: String = "",
                 isEnabled: Bool = true)
```

1.0.0
-----

Initial release. [Documentation here](https://hexedbits.github.io/StatusItemController/).
