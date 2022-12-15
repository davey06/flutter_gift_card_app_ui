#!/usr/bin/env bash
# Script for flutter build_runner:
if ! command -v fvm &>/dev/null; then
  echo 'Using flutter'
  alias f="flutter"
else
  echo 'Using fvm'
  fvm install
  alias f="fvm flutter"
fi

function startBuild() {
  f pub get
  f packages pub run build_runner build --delete-conflicting-outputs
}

echo 'Run Build Runner Script'
startBuild
