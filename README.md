# TestingTealium

This project reproduce the infinite loop in Tealium when using AppSee

# Building
This project uses cocoapods to get the 2 dependencies: **AppSee v2.1.2** and **Tealium v4.1.2**

To build the project:

```
$ git clone git@github.com:dcordero/TestingTealium.git
$ cd TestingTealium/
$ pod install
$ open TestingTealium.xcworkspace/
```

Then in XCode press the Run button

# Running and Crashing

After the Application starts a ViewController with a button labeled **"Let's go"** is presented.

Pressing that button pushes a new ViewController but at this point Tealium gets stuck in an infinite loop in UIApplication+TealiumTracker.m:101

```
(lldb) bt
* thread #1: tid = 0x9a55, 0x0000000108fd7bf5 libBacktraceRecording.dylib`gcd_queue_item_enqueue_hook + 82, queue = 'com.apple.main-thread', stop reason = EXC_BAD_ACCESS (code=2, address=0x7fff565f9f68)
    frame #0: 0x0000000108fd7bf5 libBacktraceRecording.dylib`gcd_queue_item_enqueue_hook + 82
    frame #1: 0x000000010d6dc217 libdispatch.dylib`_dispatch_introspection_queue_item_enqueue_hook + 46
    frame #2: 0x000000010d6c64ba libdispatch.dylib`_dispatch_barrier_async_f_slow + 409
  * frame #3: 0x0000000108ea1c97 TestingTealium`TealiumSendEvent(self=0x00007ffc2b41a690, _cmd=0x0000000111df7400, e=0x00007ffc2b41b2c0) + 423 at UIApplication+TealiumTracker.m:67
    frame #4: 0x0000000108ea1f5b TestingTealium`TealiumSendEvent(self=0x00007ffc2b41a690, _cmd=0x0000000111df7400, e=0x00007ffc2b41b2c0) + 1131 at UIApplication+TealiumTracker.m:101
    frame #5: 0x0000000108ea1f5b TestingTealium`TealiumSendEvent(self=0x00007ffc2b41a690, _cmd=0x0000000111df7400, e=0x00007ffc2b41b2c0) + 1131 at UIApplication+TealiumTracker.m:101
    frame #6: 0x0000000108ea1f5b TestingTealium`TealiumSendEvent(self=0x00007ffc2b41a690, _cmd=0x0000000111df7400, e=0x00007ffc2b41b2c0) + 1131 at UIApplication+TealiumTracker.m:101
    frame #7: 0x0000000108ea1f5b TestingTealium`TealiumSendEvent(self=0x00007ffc2b41a690, _cmd=0x0000000111df7400, e=0x00007ffc2b41b2c0) + 1131 at UIApplication+TealiumTracker.m:101
    frame #8: 0x0000000108ea1f5b TestingTealium`TealiumSendEvent(self=0x00007ffc2b41a690, _cmd=0x0000000111df7400, e=0x00007ffc2b41b2c0) + 1131 at UIApplication+TealiumTracker.m:101
    frame #9: 0x0000000108ea1f5b TestingTealium`TealiumSendEvent(self=0x00007ffc2b41a690, _cmd=0x0000000111df7400, e=0x00007ffc2b41b2c0) + 1131 at UIApplication+TealiumTracker.m:101
    frame #10: 0x0000000108ea1f5b TestingTealium`TealiumSendEvent(self=0x00007ffc2b41a690, _cmd=0x0000000111df7400, e=0x00007ffc2b41b2c0) + 1131 at UIApplication+TealiumTracker.m:101
    frame #11: 0x0000000108ea1f5b TestingTealium`TealiumSendEvent(self=0x00007ffc2b41a690, _cmd=0x0000000111df7400, e=0x00007ffc2b41b2c0) + 1131 at UIApplication+TealiumTracker.m:101
    frame #12: 0x0000000108ea1f5b TestingTealium`TealiumSendEvent(self=0x00007ffc2b41a690, _cmd=0x0000000111df7400, e=0x00007ffc2b41b2c0) + 1131 at UIApplication+TealiumTracker.m:101
    frame #13: 0x0000000108ea1f5b TestingTealium`TealiumSendEvent(self=0x00007ffc2b41a690, _cmd=0x0000000111df7400, e=0x00007ffc2b41b2c0) + 1131 at UIApplication+TealiumTracker.m:101
    frame #14: 0x0000000108ea1f5b TestingTealium`TealiumSendEvent(self=0x00007ffc2b41a690, _cmd=0x0000000111df7400, e=0x00007ffc2b41b2c0) + 1131 at UIApplication+TealiumTracker.m:101
    [...]
```

