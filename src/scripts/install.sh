#!/usr/bin/env bash
MIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
echo "export PATH=\"$MIN_DIR:\$PATH\"" >> "$HOME/.bashrc"
# Should check if Ruby and Python exist on the system and if not install them (add this later)