#!/usr/bin/env bash
MIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../bin" && pwd)"
grep -Fqx "export PATH=\"$MIN_DIR:\$PATH\"" "$HOME/.bashrc" ||
    echo "export PATH=\"$MIN_DIR:\$PATH\"" >> "$HOME/.bashrc"
# Should check if Python exists on the system and if not install it (add this later)
# Should also remove things such as src, plan|ideas, this file, tests and other git files but then probably make a seperate install file called dev-install.sh or something
