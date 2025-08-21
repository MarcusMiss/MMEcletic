# propertyWrapper Trimming

@Metadata {
    @PageColor(blue)
    @SupportedLanguage(swift)
    @TechnologyRoot
    @PageKind(sampleCode)
}

PropertyWrapper Trim of MMEcletic-framework.

## Overview

This sample demonstrates use propertyWrapper ``MMEcletic/Trimming``.

### Sample code

Demonstration how to use this propertyWrapper.

```swift
import MMEcletic

struct FakeData {
    @Trimming(trimSetting: .all) var all;
    @Trimming(trimSetting: .left) var left;
    @Trimming(trimSetting: .right) var right;
    @Trimming(trimSetting: .none) var none;
}

var data: FakeData = FakeData()
data.all = "  Lorem  "
data.left = "  Lorem  "
data.right = "  Lorem  "
data.none = "  Lorem  "

#expect(data.all == "Lorem")
#expect(data.left == "Lorem  ")
#expect(data.right == "  Lorem")
#expect(data.none == "  Lorem  ")

```
