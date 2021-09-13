---
title: Preferences Window
---

The Prefences is a view to present the app settings stored in `@AppStorage` property wrapper. You need to add `Settings` to you App protocol.

![preferences window](/swift-macos/images/preferences-window.png)

```swift
import SwiftUI

@main
struct PreferencesWindowApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        Settings {
            SettingsView()
        }
    }
}
```

Using `TabView` you can group settings into different collections and make them easier to find.
![preferences window general](/swift-macos/images/preferences-window-general.png)

```swift
import SwiftUI

struct SettingsView: View {
    
    private enum Tabs: Hashable {
        case general
    }
    
    var body: some View {
        TabView {
            GeneralSettingsView()
                .tabItem {
                    Label("General", systemImage: "gear")
                }
                .tag(Tabs.general)
        }
        .padding(20)
        .frame(width: 350, height: 100)
    }
}
```

Setting "fontSize" as key and its CGFloat value in `@AppStorage`.


```swift
import SwiftUI

struct GeneralSettingsView: View {
    
    @AppStorage("fontSize") private var fontSize = 12.0
    
    var body: some View {
        VStack {
            Slider(value: $fontSize, in: 9...82) {
                Text("Font Size (\(fontSize, specifier: "%.0f") pts)")
            }
        }
    }
}
```

```swift
import SwiftUI

struct ContentView: View {
    
    @AppStorage("fontSize") private var fontSize = 12
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .font(.system(size: CGFloat(fontSize)))
            Text("Font size of the text can be changed in the Preferences... ⌘,")
        }
        .frame(width: 420, height: 260)
        .padding()
    }
}
```