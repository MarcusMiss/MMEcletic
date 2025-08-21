# propertyWrapper Case

@Metadata {
    @PageColor(blue)
    @SupportedLanguage(swift)
    @TechnologyRoot
    @PageKind(sampleCode)
}

PropertyWrapper Case of MMEcletic-framework.

## Overview

This sample demonstrates use propertyWrapper ``MMEcletic/Case``.

### Sample code

Demonstration how to use this propertyWrapper.

```swift
import MMEcletic

struct FakeData {
    @Case(caseSetting: .uppercase) var upper;
    @Case(caseSetting: .lowercase) var lower;
    @Case(caseSetting: .capitalize) var capital;
    @Case(caseSetting: .none) var none;
}

var data: FakeData = FakeData()
data.upper = "LoreM IpSum"
data.lower = "LoreM IpSum"
data.capital = "loreM IpSum"
data.none = "LoreM IpSum"

#expect(data.upper == "LOREM IPSUM")
#expect(data.lower == "lorem ipsum")
#expect(data.capital == "Lorem Ipsum")
#expect(data.none == "LoreM IpSum")

```
