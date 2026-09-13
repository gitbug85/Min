#!/usr/bin/env bash
MIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
echo "export PATH=\"$MIN_DIR:\$PATH\"" >> "$HOME/.bashrc"