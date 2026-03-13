#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "Usage: $0 <sha256-fingerprint>"
  echo "Example: $0 SHA256:abc123..."
}

target="${1:-}"
if [[ -z "$target" ]]; then
  usage
  exit 1
fi

# Accept both "abc..." and "SHA256:abc..." formats.
target="${target#SHA256:}"
target="SHA256:${target}"

found=0
for key in "$HOME"/.ssh/*.pub; do
  [[ -f "$key" ]] || continue

  fingerprint="$(ssh-keygen -lf "$key" -E sha256 | awk '{print $2}')"
  if [[ "$fingerprint" == "$target" ]]; then
    echo "Match found: $key"
    ssh-keygen -lf "$key" -E sha256
    found=1
  fi
done

if [[ "$found" -eq 0 ]]; then
  echo "No matching key found in $HOME/.ssh"
  exit 2
fi
