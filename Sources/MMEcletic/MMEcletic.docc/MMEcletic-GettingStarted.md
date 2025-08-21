# GettingStarted

@Metadata {
    @PageColor(blue)
    @SupportedLanguage(swift)
    @TechnologyRoot
}

How to use MMEcletic?

## Overview

Here you will find some instructions how to add the framework to your own project.

### Adding MMEcletic dependency

Use the MMEcletic-framework just like any other Swift-framework: just add it as a dependency.

```swift
let package = Package(
...
    dependencies: [
        ...
        .package( url: "https://github.com/MarcusMiss/MMEcletic", branch: "master")
        ...
],
    targets: [
    .target(
            name: "YourTarget",
            dependencies: [
                ...
                .product(name: "MMEcletic", package: "MMEcletic"),
                ...
            ]
        ),
        .testTarget(
            name: "YourTargetTests",
            dependencies: [
                ...
                .product(name: "MMEcletic", package: "MMEcletic"),
                ...
            ]
        ),
    ]
...
)
```

In our code...
```swift

import MMEcletic

...
let msg = "   Hello World  ".trim()
print("\(msg)")

```

