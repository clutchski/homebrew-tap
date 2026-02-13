#!/usr/bin/env bash
set -euo pipefail

TAG="${1:?usage: update-formula.sh <tag>}"
TARBALL_URL="https://github.com/clutchski/dottie/archive/refs/tags/${TAG}.tar.gz"
SHA256=$(curl -sL "$TARBALL_URL" | sha256sum | cut -d ' ' -f 1)

FORMULA="$(dirname "$0")/../Formula/dottie.rb"
sed -i "s|url \".*\"|url \"${TARBALL_URL}\"|" "$FORMULA"
sed -i "s|sha256 \".*\"|sha256 \"${SHA256}\"|" "$FORMULA"

echo "Updated formula to ${TAG} (sha256: ${SHA256})"
