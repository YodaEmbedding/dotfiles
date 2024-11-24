#!/usr/bin/env bash

HW_ARCH="$(uname -m)"

if [ "$HW_ARCH" == "x86_64" ]; then
  ARCH="x86_64-unknown-linux-musl"
elif [ "$HW_ARCH" == "aarch64" ]; then
  ARCH="aarch64-unknown-linux-gnu"
elif [ "$HW_ARCH" == "armv7l" ]; then
  ARCH="armv7-unknown-linux-gnueabihf"
elif [ "$HW_ARCH" == "arm64" ]; then
  ARCH="aarch64-apple-darwin"
else
  echo "Unsupported architecture: $HW_ARCH"
  exit 1
fi
