#!/bin/sh

xcrun xcodebuild docbuild \
    -scheme 'MMEcletic' \
    -destination 'generic/platform=iOS Simulator' \
    -derivedDataPath "$PWD/.derivedData"

xcrun docc process-archive transform-for-static-hosting \
    "$PWD/.derivedData/Build/Products/Debug-iphonesimulator/MMEcletic.doccarchive" \
    --output-path "docc" \
    --hosting-base-path "https://marcusmiss.github.io/MMEcletic"

echo '<!DOCTYPE html><html><head><meta http-equiv = "refresh" content = "0; url = https://marcusmiss.github.io/MMEcletic/documentation/mmecletic/" /></head><body></body></html>' > docc/index.html
