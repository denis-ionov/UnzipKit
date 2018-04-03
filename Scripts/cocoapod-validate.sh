#!/bin/bash

set -ev

. Scripts/set-travis-tag-to-latest.sh

pod --version

pod env

export "OS_ACTIVITY_MODE"="disable"

# Lint the podspec to check for errors. Don't call `pod spec lint`, because we want it to evaluate locally
pod lib lint --verbose

. Scripts/unset-travis-tag.sh
