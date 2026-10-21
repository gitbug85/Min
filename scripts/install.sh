#!/usr/bin/env bash
MIN_BIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../bin" && pwd)"
grep -Fqx "export PATH=\"$MIN_BIN_DIR:\$PATH\"" "$HOME/.bashrc" ||
    echo "export PATH=\"$MIN_BIN_DIR:\$PATH\"" >> "$HOME/.bashrc"
MIN_DIR=$(dirname "$realpath")
# Delete unnecessary files
# Should check if Python exists on the system and if not install it (add this later)
