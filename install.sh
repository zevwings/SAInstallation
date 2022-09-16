#!/bin/sh  

# fastlane

if [[ ! -n "$(which fastlane)" ]]; then 
  sudo gem install -n /usr/local/bin fastlane -NV && sudo fastlane install_plugins
else
  echo "fastlane is installed"
fi

# swiftlint

if [[ ! -n "$(which swiftlint)" ]]; then 
  brew install swiftlint
else
  echo "swiftlint is installed"
fi

# Carthage

if [[ ! -n "$(which carthage)" ]]; then 
  brew install carthage
else
  echo "carthage is installed"
fi

# Cocoapods

if [[ ! -n "$(which pod)" ]]; then 
  brew install pod
else
  echo "cocoapods is installed"
fi
