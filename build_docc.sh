#!/bin/sh

xcrun xcodebuild docbuild \
    -scheme 'MMEcletic' \
    -destination 'generic/platform=iOS Simulator' \
    -derivedDataPath "$PWD/.derivedData"

xcrun docc process-archive transform-for-static-hosting \
    "$PWD/.derivedData/Build/Products/Debug-iphonesimulator/MMEcletic.doccarchive" \
    --output-path "docc" \
    --hosting-base-path "" # "https://marcusmiss.github.io/mmecletic"

echo '<html><body><script>window.location.href += "/documentation/mmecletic"</script></body></html>' > docc/index.html

# To test locally:
# set: --hosting-base-path ""
# run: python3 -m http.server -d docc
