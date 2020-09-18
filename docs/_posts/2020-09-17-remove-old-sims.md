---
title: Remove old simulators
category: Xcode
tags: [macOS, Xcode]
---

If you've been using Xcode for a while, you should remove old simulators that are no longer supported to clear up some space. Use the following terminal command to delete the old simulators:

```bash
$ xcrun simctl delete unavailable
```
