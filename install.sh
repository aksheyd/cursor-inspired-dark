#!/usr/bin/env bash
# Install the "Cursor Inspired Dark" theme into VS Code and/or Cursor
# by symlinking this repo into the editor's extensions directory.
#
# Usage:
#   ./install.sh           # installs into both VS Code and Cursor (if present)
#   ./install.sh code      # VS Code only
#   ./install.sh cursor    # Cursor only

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
EXT_NAME="cursor-inspired-dark"

install_into() {
  local ext_dir="$1"
  local label="$2"

  if [ ! -d "$ext_dir" ]; then
    echo "  skip $label: $ext_dir does not exist"
    return
  fi

  local target="$ext_dir/$EXT_NAME"

  # Remove anything already there (old symlink, old install)
  if [ -e "$target" ] || [ -L "$target" ]; then
    rm -rf "$target"
  fi

  ln -s "$REPO_DIR" "$target"
  echo "  ✓ $label: $target -> $REPO_DIR"
}

target="${1:-all}"

case "$target" in
  code|vscode)
    install_into "$HOME/.vscode/extensions" "VS Code"
    ;;
  cursor)
    install_into "$HOME/.cursor/extensions" "Cursor"
    ;;
  all)
    install_into "$HOME/.vscode/extensions" "VS Code"
    install_into "$HOME/.cursor/extensions" "Cursor"
    ;;
  *)
    echo "Usage: $0 [code|cursor|all]" >&2
    exit 1
    ;;
esac

echo
echo "Done. Restart your editor, then pick the theme:"
echo "  Cmd+K Cmd+T  →  'Cursor Inspired Dark'"
