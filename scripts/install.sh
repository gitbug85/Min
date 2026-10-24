#!/usr/bin/env bash
MIN_BIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../bin" && pwd)"
grep -Fqx "export PATH=\"$MIN_BIN_DIR:\$PATH\"" "$HOME/.bashrc" ||
    echo "export PATH=\"$MIN_BIN_DIR:\$PATH\"" >> "$HOME/.bashrc"
MIN_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

# Delete unnecessary files and directories
rm -rf \
    "$MIN_DIR/src" \
    "$MIN_DIR/tests" \
    "$MIN_DIR/.git" \
    "$MIN_DIR/.github" \
    "$MIN_DIR/bootstrap"

rm -f \
    "$MIN_DIR/PLAN.md" \
    "$MIN_DIR/README.md" \
    "$MIN_DIR/.gitignore" \
    "$MIN_DIR/.gitattributes"
