---
title: Remove old simulators
slug: remove-old-sims
date: 2020-09-17
---

If you've been using Xcode for a while, you should remove old simulators that are no longer supported to clear up some space. Use the following terminal command to delete the old simulators:

```bash
$ xcrun simctl delete unavailable
```
