#!/bin/sh

if [[ ! $CI && ! $SKIP_SWIFTLINT ]]; then
  Pods/SwiftLint/swiftlint --no-cache
fi
