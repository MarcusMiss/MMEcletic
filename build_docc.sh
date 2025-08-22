#!/bin/sh

xcrun xcodebuild docbuild \
    -scheme 'MMEcletic' \
    -destination 'generic/platform=iOS Simulator' \
    -derivedDataPath "$PWD/.derivedData"

xcrun docc process-archive transform-for-static-hosting \
    "$PWD/.derivedData/Build/Products/Debug-iphonesimulator/MMEcletic.doccarchive" \
    --output-path "docc" \
    --hosting-base-path "https://marcusmiss.github.io/mmecletic"

echo '<script>window.location.href += "/documentation/mmecletic"</script>' > docc/index.html
