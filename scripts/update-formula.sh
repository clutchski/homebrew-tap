#!/usr/bin/env bash
set -euo pipefail

TAG="${1:?usage: update-formula.sh <tag>}"
TARBALL_URL="https://github.com/clutchski/dottie/archive/refs/tags/${TAG}.tar.gz"
SHA256=$(curl -sL "$TARBALL_URL" | sha256sum | cut -d ' ' -f 1)

FORMULA="$(dirname "$0")/../Formula/dottie.rb"

# Create temp file for portability across macOS and Linux sed
tmp=$(mktemp)
sed "s|url \".*\"|url \"${TARBALL_URL}\"|" "$FORMULA" \
  | sed "s|sha256 \".*\"|sha256 \"${SHA256}\"|" > "$tmp"
mv "$tmp" "$FORMULA"

echo "Updated formula to ${TAG} (sha256: ${SHA256})"
