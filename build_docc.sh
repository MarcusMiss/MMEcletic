#!/bin/sh

xcrun xcodebuild docbuild \
    -scheme 'MMEcletic' \
    -destination 'generic/platform=iOS Simulator' \
    -derivedDataPath "$PWD/.derivedData"

xcrun docc process-archive transform-for-static-hosting \
    "$PWD/.derivedData/Build/Products/Debug-iphonesimulator/MMEcletic.doccarchive" \
    --output-path ".docs" \
    --hosting-base-path "https://github.com/MarcusMiss/MMEcletic"

echo '<script>window.location.href += "/documentation/mmecletic"</script>' > .docs/index.html
