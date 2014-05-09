# needed if you're running the OS-X system python
try:
    # from AppKit import NSApp, NSApplication
    import AppKit
    assert AppKit
except:
    pass

import glfw_test as t
t.run()
