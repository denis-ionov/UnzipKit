#!/bin/bash

set -ev

. Scripts/set-travis-tag-to-latest.sh

pod env

# Lint the podspec to check for errors. Don't call `pod spec lint`, because we want it to evaluate locally

# Using awk to remove logging from output until CocoaPods issue #7577 is implemented and I can use the
# OS_ACTIVITY_MODE = disable environment variable from the test spec scheme
mkdir lintlogs
pod lib lint --verbose | tee lintlogs/before_filter.txt | sed '/xctest\[/d; /^$/d' | tee lintlogs/after_filter.txt

. Scripts/unset-travis-tag.sh
