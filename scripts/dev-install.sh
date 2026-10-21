#!/usr/bin/env bash
MIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../bin" && pwd)"
grep -Fqx "export PATH=\"$MIN_DIR:\$PATH\"" "$HOME/.bashrc" ||
    echo "export PATH=\"$MIN_DIR:\$PATH\"" >> "$HOME/.bashrc"
