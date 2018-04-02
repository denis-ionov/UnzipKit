#!/bin/bash

set -ev

. Scripts/set-travis-tag-to-latest.sh

pod --version

pod env

# Make the test logging output quieter
if [ -n "$CI" ]; then
    echo -e "\nSetting log level to default for CI build..."
    sudo log config --mode "level:default"
fi

# Lint the podspec to check for errors. Don't call `pod spec lint`, because we want it to evaluate locally
pod lib lint --verbose

. Scripts/unset-travis-tag.sh
